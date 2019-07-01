class PostShowSerializer < ActiveModel::Serializer
  attributes :id,
  :Post_Title,
  :Post_Content,
  :Post_Tag,
  :organization_id

  has_many :comments, as: :commenteable
  has_many :resources, as: :resourceable
end
