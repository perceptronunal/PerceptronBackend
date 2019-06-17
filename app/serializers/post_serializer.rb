class PostSerializer < ActiveModel::Serializer
    attributes :id,
    :Post_Title,
    :Post_Content,
    :Post_Tag,
    :organization_id
  
    belongs_to :organization
    has_many :comments, as: :commenteable
    has_many :resources, as: :resourceable
    
  end
  