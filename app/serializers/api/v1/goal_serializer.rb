class Api::V1::GoalSerializer < Api::V1::BaseSerializer
  attributes :id, :credential_id, :slug, :last_value, :metric_key, :active, :fail_count

  has_many :scores, serializer: Api::V1::ScoreSerializer

end
