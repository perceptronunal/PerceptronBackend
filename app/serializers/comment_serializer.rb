class CommentSerializer < ActiveModel::Serializer
    attributes :id,
    :Comment_Comment,
    :commenteable_type,
    :commenteable_id,
    :user_id
    
  end
  