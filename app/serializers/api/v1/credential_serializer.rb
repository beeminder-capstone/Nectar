class Api::V1::CredentialSerializer < Api::V1::BaseSerializer
  attributes :id, :provider_name, :uid, :info, :created_at, :updated_at

end
