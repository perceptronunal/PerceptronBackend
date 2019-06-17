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
  :Pet_Description

  has_many :comments
  
end
