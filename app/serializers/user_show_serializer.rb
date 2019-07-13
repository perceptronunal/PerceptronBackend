class UserShowSerializer < ActiveModel::Serializer
  attributes :User_Name, :User_Email, :User_Phone, :User_City, :pets, :profile, :resources

  def pets
    object.connections.where(Connection_Type: 'Publicar').count
  end
  
  def profile
    profile = object.resources.where(Resource_Type: 'profile')
    profile[0]
  end

  def resources
    object.resources.where.not(Resource_Type: 'profile')
  end
  
end
