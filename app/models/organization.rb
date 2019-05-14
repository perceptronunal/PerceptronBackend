class Organization < ApplicationRecord
    #validations
    validates :Organization_Name, presence: true
    validates :Organization_Address, presence: true
    validates :Organization_Phone, presence: true
    validates :Organization_Email, presence: true
    validates :Organization_Website, presence: true
    validates :Organization_Description, presence: true

    #Asociations
    has_many :posts, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy

end
