class ConnectionSerializer < ActiveModel::Serializer


  attributes

  belongs_to :pet
  has_one :connectable
end
