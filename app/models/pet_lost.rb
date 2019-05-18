class PetLost < ApplicationRecord
    #validations
    validates :PetLost_Type, presence: true
    validates :PetLost_Name, presence: true
    validates :PetLost_Gender, presence: true
    validates :PetLost_Size, presence: true
    validates :PetLost_Description, presence: true
    #validates :PetLost_Found, presence: true

    #Asociations
    belongs_to :user
    has_many :comments, as: :commenteable, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy
    
end
