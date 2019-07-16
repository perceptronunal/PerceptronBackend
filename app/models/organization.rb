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
    validates :Organization_Email, presence: true, uniqueness: true
    #validates :Organization_Website, presence: true
    #validates :Organization_Description, presence: true
    #validates :Organization_Validation, presence: true
    validates :password, presence: true, :on => :create

    #Asociations
    has_many :posts, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy
    has_many :connections, as: :connectable, dependent: :destroy
    has_many :pets, through: :connections
    
    after_save :login_create, on: [:create]
    after_update :login_update, on: [:update]

    scope :Organization_Validation, -> { where(Organization_Validation: true) }

    def self.allPublications
        query = " select count(\"organization_id\")
        from organizatons inner join posts on organizatons.id = organization_id "
    end



    private
    def login_create
        login = Login.new(email: self.Organization_Email, password_digest: self.password_digest)
        login.save
    end

    def login_update
        login = Login.find_by(email: self.Organization_Email)
        login.update(email: self.Organization_Email, password_digest: self.password_digest)
    end

end
