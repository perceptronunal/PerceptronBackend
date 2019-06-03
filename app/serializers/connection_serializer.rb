class ConnectionSerializer < ActiveModel::Serializer
  attributes :id, :Connection_Type, :pet_id, :user_id, :organization_id
end
