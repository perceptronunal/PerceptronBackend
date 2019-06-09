# == Schema Information
#
# Table name: organizations
#
#  id                       :bigint           not null, primary key
#  Organization_Name        :string
#  Organization_Address     :string
#  Organization_Phone       :string
#  Organization_Email       :string
#  Organization_Website     :string
#  Organization_Description :string
#  Organization_Validation  :boolean
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Organization < ApplicationRecord
    has_secure_password
    #validations
    validates :Organization_Name, presence: true
    validates :Organization_Address, presence: true
    validates :Organization_Phone, presence: true
    validates :Organization_Email, presence: true
    #validates :Organization_Website, presence: true
    #validates :Organization_Description, presence: true
    #validates :Organization_Validation, presence: true
    validates :password, presence: true

    #Asociations
    has_many :posts, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy
    has_many :connections, as: :commenteable, dependent: :destroy

    scope :Organization_Validation, -> { where(Organization_Validation: true) }

    def self.allPublications
        query = " select count(\"organization_id\")
        from organizatons inner join posts on organizatons.id = organization_id "
    end

    #Authorization override
    def self.from_token_request request
        organization_email = request.params["auth"] && request.params["auth"]["Organization_Email"]
        self.find_by Organization_Email: organization_email
    end
end
