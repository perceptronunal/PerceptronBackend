# == Schema Information
#
# Table name: users
#
#  User_Email :bigint           not null, primary key
#  User_Name  :string
#  User_Email :string
#  User_Phone :string
#  User_City  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
    has_secure_password
    #validations
    validates :User_Name, presence: true
    validates :User_Email, presence: true, uniqueness: true
    validates :password, presence: true#, length: { minimum: 6 }

    #associations
    has_many :connections, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy

    #Authorization override
    def self.from_token_request request
        user_email = request.params["auth"] && request.params["auth"]["User_Email"]
        self.find_by User_Email: user_email
    end
end
