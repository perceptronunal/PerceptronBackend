class ConnectionSerializer < ActiveModel::Serializer
  attributes :Connection_Type,
  :connectable_type,
  :connectable_id,
  :pet_id
end
