# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  credential_id :integer          not null
#  slug          :string           not null
#  last_value    :float
#  params        :json             not null
#  metric_key    :string           not null
#  active        :boolean          default(TRUE), not null
#  fail_count    :integer          default(0), not null
#

class Goal < ActiveRecord::Base
  belongs_to :credential
  has_many :scores, dependent: :destroy
  has_one :user, through: :credential

  delegate :provider, to: :credential
  
  attr_accessor :new_goal, :title, :type, :rate

  validates :slug, :new_goal, presence: true
  validates :title, :type, :rate, presence: true, if: :new_goal
  validate :valid_params

  scope :active, -> { where(active: true) }
  
  before_create do
	if new_goal
		t = Time.now
		decade = 60 * 60 * 24 * 365 * 10
		goaldate = t.to_i + decade
		credential.client.create_goal(slug: :slug, title: :title, goal_type: :type, goaldate: goaldate, rate: :rate)
	end
  end

  def metric
    provider.find_metric(metric_key)
  end

  def sync
    transaction { with_lock { sync_process } }
  end

  def beeminder_goal
    user.beeminder_goal(slug)
  rescue User::SlugNotFound
    Rails.logger.warn "Count not find Beeminder goal #{slug} for user #{user.inspect}"
    nil
  end

  def fetch_scores
    Array(metric.call(credential.client, options))
  end

  private

  def sync_process
    if (bgoal = beeminder_goal)
      calculated = fetch_scores
      stored = scores.order(:timestamp).map(&:to_datapoint)
      syncher = DatapointsSync.new(calculated, stored, bgoal)
      syncher.call
      store_scores syncher.storable
    else
      update! active: false
    end
  end

  def store_scores(datapoints)
    return if datapoints.empty?
    scores.delete_all
    columns = %i(goal_id unique timestamp value)
    score_records = datapoints.map do |datapoint|
      [id,
       datapoint.unique,
       datapoint.timestamp || Time.zone.now,
       datapoint.value]
    end

    Score.import columns, score_records
  end

  def options
    params.with_indifferent_access
  end

  def valid_params
    errors[:params] = metric.param_errors(params)
  end
end
