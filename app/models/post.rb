class Post < ApplicationRecord
    #validations
    validates :Post_Title, presence: true
    validates :Post_Content, presence: true

        
    #associations
    belongs_to :organization
    has_many :comments, as: :commenteable, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy

end
