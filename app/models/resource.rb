class Resource < ApplicationRecord
    #validations
    validates :Resource_Type, presence: true
    validates :Resource_Link, presence: true

    #Asociations
    belongs_to :resourceable, polymorphic: true
end
