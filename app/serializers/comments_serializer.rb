class CommentsSerializer < ActiveModel::Serializer
  attributes :Comment_Comment, :commenteable_type, :commenteable_id
end
