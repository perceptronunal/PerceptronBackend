# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  Post_Title      :string
#  Post_Content    :text
#  Post_Tag        :string
#  organization_id :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Post < ApplicationRecord
    #validations
    validates :Post_Title, presence: true
    validates :Post_Content, presence: true

        
    #associations
    belongs_to :organization
    has_many :comments, as: :commenteable, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy

end
