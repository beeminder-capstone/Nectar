# == Schema Information
#
# Table name: credentials
#
#  id                :integer          not null, primary key
#  beeminder_user_id :string           not null
#  provider_name     :string           not null
#  uid               :string           default(""), not null
#  info              :json             not null
#  credentials       :json             not null
#  extra             :json             not null
#  created_at        :datetime
#  updated_at        :datetime
#  password          :string           default(""), not null
#
=begin
 * Created by PSU Beeminder Capstone Team on 3/12/2017.
 * Copyright (c) 2017 PSU Beeminder Capstone Team
 * This code is available under the "MIT License".
 * Please see the file LICENSE in this distribution for license terms.
=end
class Credential < ActiveRecord::Base
  validates :uid, :user, presence: true

  belongs_to :user, primary_key: :beeminder_user_id, foreign_key: :beeminder_user_id
  has_many :goals, dependent: :destroy

  def client
    authorization = credentials.merge(
      uid: uid,
      password: password
    ).with_indifferent_access
    provider.adapter.new(authorization)
  end

  def provider
    PROVIDERS.fetch(provider_name)
  end

  def access_token
    credentials.fetch "token"
  end

  def valid_access_token
    errors.add(:credentials, "missing token key") unless credentials["token"]
  end

  def access_secret
    credentials.fetch "secret"
  end

  def valid_access_secret
    errors.add(:credentials, "missing token key") unless credentials["token"]
  end
end
