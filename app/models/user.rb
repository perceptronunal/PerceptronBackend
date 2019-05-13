class User < ApplicationRecord
        #validations
        validates :User_Name, presence: true
        validates :User_Email, presence: true, uniqueness: true
        validates :User_Phone, presence: true
        validates :User_City, presence: true

        #associations
        has_many :interested_ins, dependent: :destroy
        
end
