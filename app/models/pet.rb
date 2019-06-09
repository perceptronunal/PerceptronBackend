# == Schema Information
#
# Table name: pets
#
#  id              :bigint           not null, primary key
#  Pet_Type        :string
#  Pet_Name        :string
#  Pet_Gender      :string
#  Pet_Age         :integer
#  Pet_Size        :string
#  Pet_Color       :string
#  Pet_Sterilized  :boolean
#  Pet_Vaccinated  :boolean
#  Pet_Description :text
#  Pet_Visible     :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Pet < ApplicationRecord
    #validations
    validates :Pet_Type, presence: true
    validates :Pet_Name, presence: true
    validates :Pet_Gender, presence: true
    #validates :Pet_Age, presence: true
    #validates :Pet_Size, presence: true
    validates :Pet_Color, presence: true
    #validates :Pet_Sterilized, presence: true
    #validates :Pet_Vaccinated, presence: true
    validates :Pet_Description, presence: true
    #validates :Pet_Visible, presence: true

    #associations
    has_many :connections, dependent: :destroy
    has_many :comments, as: :commenteable, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy

    scope :Pet_Visible, -> { where(Pet_Visible: true) }

    def self.petsToAdopt
        query = " select pets.id, \"Pet_Name\", \"Pet_Gender\", \"Pet_Age\"
        from connections inner join pets on pet_id = pets.id
        where \"Pet_Visible\" = true and \"Connection_Type\" = 'Publicar' "
    end

    def self.petsToFind
        query = " select pets.id, \"Pet_Name\", \"Pet_Gender\", \"Pet_Age\"
        from connections inner join pets on pet_id = pets.id
        where \"Pet_Visible\" = true and \"Connection_Type\" = 'Perdido' "
    end

    def self.waitToAdopt(id)
        query = " select * from connections 
        where \"pet_id\" = #{id} and \"Connection_Type\" = 'Adoptar' "
    end
    
end
