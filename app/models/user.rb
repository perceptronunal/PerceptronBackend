# == Schema Information
#
#     t.string "User_Name"
#     t.string "User_Email"
#     t.string "User_Phone"
#     t.string "User_City"
#     t.string "password_digest"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#

class User < ApplicationRecord
    has_secure_password
    #validations
    validates :User_Name, presence: true
    validates :User_Email, presence: true, uniqueness: true
    validates :password, presence: true#, length: { minimum: 6 }

    #associations
    has_many :resources, as: :resourceable, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :connections, as: :connectable, dependent: :destroy
    has_one :profilepictures, as: :profilepicturesable, dependent: :destroy
    
    def self.allPublications
        query = " select count(\"user_id\")
        from users inner join connections on users.id = user_id
        where \"Connection_Type\" = 'Publicar' "
    end

    #Authorization override
    # def self.from_token_request request
    #     user_email = request.params["auth"] && request.params["auth"]["User_Email"]
    #     self.find_by User_Email: user_email
    # end

    def self.usersToLikes(id)
        query = "select * from connections 
        where \"Connection_Type\" = 'Interesado' and \"connectable_id\" = #{id}"
    end
end
