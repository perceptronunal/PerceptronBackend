class PetSerializer < ActiveModel::Serializer
  attributes :id,
  :Pet_Type,
  :Pet_Name,
  :Pet_Gender,
  :Pet_Age,
  :Pet_Size,
  :Pet_Color,
  :Pet_Sterilized,
  :Pet_Vaccinated,
  :Pet_Description,
  :resources,
  :connections

  has_many :comments, as: :commenteable,  serializer: CommentSerializer


  def resources
    object.resources
  end

  has_many :connections do
    object.connections.where(Connection_Type: 'Adoptado')
  end

end
