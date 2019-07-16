class PetIndexSerializer < ActiveModel::Serializer
  attributes :id,
  :Pet_Name,
  :Pet_Type,
  :Pet_Gender,
  :Pet_Age

  has_many :resources, as: :resourceable
  has_many :comments, as: :commenteable,  serializer: CommentSerializer
  
  
end
