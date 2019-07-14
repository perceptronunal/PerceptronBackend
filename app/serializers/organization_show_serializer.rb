class OrganizationShowSerializer < ActiveModel::Serializer
  attributes :id,
  :Organization_Name,
  :Organization_Address,
  :Organization_Phone,
  :Organization_Email,
  :Organization_Website,
  :Organization_Description,
  #:Organization_Validation,
  :posts,
  :pets,
  :interested_pets,
  :created_at,
  :updated_at,
  :profile

  def posts
    object.posts.count
  end

  def pets
    object.connections.where(Connection_Type: 'Publicar').count
  end

  def interested_pets
    object.connections.where(Connection_Type: 'Interesado').count
  end

  def profile
    profile = object.resources.where(Resource_Type: 'profile')
    profile[0]
  end

  has_many :resources, as: :resourceable
end
