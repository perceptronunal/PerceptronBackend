class CommentSerializer < ActiveModel::Serializer
    attributes :id,
    :Comment_Comment,
    :commenteable_type,
    :commenteable_id,
    :user_id,
    :created_at,
    :updated_at
    
    belongs_to :user
    
  end
  