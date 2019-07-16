class PetShowSerializer < ActiveModel::Serializer
  attributes :id,
  :Pet_Type,
  :Pet_Name,
  :Pet_Gender,
  :Pet_Age,
  :Pet_Size,
  :Pet_Color,
  :Pet_Sterilized,
  :Pet_Vaccinated,
  :Pet_Description
  

  has_many :resources, as: :resourceable
  has_many :comments, as: :commenteable,  serializer: CommentSerializer
end
