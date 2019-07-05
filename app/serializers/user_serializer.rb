class UserSerializer < ActiveModel::Serializer
  attributes :User_Name, :User_Email, :User_Phone, :User_City, :profile
  
  def profile
    object.resources.where(Resource_Type: 'profile')
  end

end
