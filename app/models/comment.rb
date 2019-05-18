class Comment < ApplicationRecord
    #validations
    validates :Comment_Comment, presence: true
    belongs_to :commenteable, polymorphic: true

end
