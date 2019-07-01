class PetIndexSerializer < ActiveModel::Serializer
  attributes :id,
  :Pet_Name,
  :Pet_Type,
  :Pet_Gender,
  :Pet_Age
end
