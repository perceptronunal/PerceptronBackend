class Pet < ApplicationRecord
    #validations
    validates :Pet_Type, presence: true
    validates :Pet_Name, presence: true
    validates :Pet_Gender, presence: true
    validates :Pet_Age, presence: true
    validates :Pet_Size, presence: true
    validates :Pet_Sterilized, presence: true
    validates :Pet_Vaccine, presence: true
    validates :Pet_Description, presence: true
    validates :Pet_Adopted, presence: true

    #associations
    has_many :interested_ins, dependent: :destroy
    has_many :comments, as: :commentable :destroy
    has_many :resources, as: :resourceable :destroy
    
end
