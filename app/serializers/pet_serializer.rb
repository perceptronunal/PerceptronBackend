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
  :adopted,
  :found,
  :resources

  has_many :comments, as: :commenteable,  serializer: CommentSerializer

  def resources
    object.resources
  end

  def adopted
    object.connections.where(Connection_Type: 'Adoptado').first().as_json
  end

  def found
    object.connections.where(Connection_Type: 'Encontrado').first().as_json
  end


end
