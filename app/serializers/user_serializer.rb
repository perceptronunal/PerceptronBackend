class UserSerializer < ActiveModel::Serializer
  attributes :User_Name, :User_Email, :User_Phone, :User_City, :profile, :resources
  
  def profile
    profile = object.resources.where(Resource_Type: 'profile')
    profile[0]
  end

  has_many :resources

end
