class Post < ApplicationRecord
    #validations
    validates :User_Name, presence: true
    validates :User_Email, presence: true, uniqueness: true
    validates :User_Phone, presence: true
    validates :User_City, presence: true
        
    #associations
    belongs_to :organization
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy

end
