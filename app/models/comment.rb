# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  Comment_Comment   :text
#  commenteable_type :string
#  commenteable_id   :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ApplicationRecord
    #validations
    validates :Comment_Comment, presence: true
    belongs_to :commenteable, polymorphic: true    
    belongs_to :user

end
