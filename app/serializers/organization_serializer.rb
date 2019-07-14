class OrganizationSerializer < ActiveModel::Serializer
  attributes :id,
  :Organization_Name,
  :Organization_Address,
  #:Organization_Phone,
  :Organization_Email,
  :Organization_Website,
  :Organization_Description,
  #:Organization_Validation,
  :posts,
  :pets,
  :interested_organizations,
  :created_at,
  :updated_at,
  :profile,
  :resources

  def interested_organizations
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
