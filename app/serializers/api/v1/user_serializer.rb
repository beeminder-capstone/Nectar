class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :beeminder_user_id, :created_at, :updated_at

  has_many :credentials, foreign_key: :beeminder_user_id, serializer: Api::V1::CredentialSerializer
  has_many :goals, through: :credentials, serializer: Api::V1::GoalSerializer
  has_many :providers
  
  def providers
    @_providers ||= PROVIDERS.map do |provider|
      ProviderDecorator.new(provider, object.credentials)
    end
  end

end
