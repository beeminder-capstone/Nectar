class Api::V1::BaseSerializer < ActiveModel::Serializer
  #just some basic attributes
  #attributes :access_token

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end
