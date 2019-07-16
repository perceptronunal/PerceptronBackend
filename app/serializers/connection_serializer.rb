class ConnectionSerializer < ActiveModel::Serializer

  belongs_to :pet
  has_one :connectable
  
end
