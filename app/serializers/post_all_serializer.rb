class PostAllSerializer < ActiveModel::Serializer
  attributes :id,
  :Post_Title,
  :Post_Content,
  :Post_Tag,
  :organization_id,
  :created_at,
  :updated_at

  has_many :comments, as: :commenteable,  serializer: CommentSerializer
  has_many :resources, as: :resourceable
  belongs_to :organization
end
