class OrganizationSerializer < ActiveModel::Serializer
  attributes :id,
  :organization,
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
  :profile,
  :resources

  def organization
    object.class.to_s
  end

  def interested_pets
    object.connections.where(Connection_Type: 'Interesado').count
  end

  def posts
    object.posts.count
  end

  def pets
    object.connections.where(Connection_Type: 'Publicar').count
  end

  def profile
    profile = object.resources.where(Resource_Type: 'profile')
    profile[0]
  end
  def profile
    profile = object.resources.where(Resource_Type: 'profile')
    profile[0]
  end

  def resources
    object.resources.where.not(Resource_Type: 'profile')
  end

end
