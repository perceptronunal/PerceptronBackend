class User < ApplicationRecord
        #validations
        validates :User_Name, presence: true
        validates :User_Email, presence: true, uniqueness: true

        #associations
        has_many :connections, dependent: :destroy
        has_many :resources, as: :resourceable, dependent: :destroy
end
