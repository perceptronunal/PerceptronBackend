class Pet < ApplicationRecord
    #validations
    validates :Pet_Type, presence: true
    validates :Pet_Name, presence: true
    validates :Pet_Gender, presence: true
    #validates :Pet_Age, presence: true
    validates :Pet_Size, presence: true
    validates :Pet_Color, presence: true
    #validates :Pet_Sterilized, presence: true
    #validates :Pet_Vaccinated, presence: true
    validates :Pet_Description, presence: true
    validates :Pet_Visible, presence: true

    #associations
    has_many :connections, dependent: :destroy
    has_many :comments, as: :commenteable, dependent: :destroy
    has_many :resources, as: :resourceable, dependent: :destroy


    def self.petsToAdopt
        ActiveRecord::Base.connection.exec_query("
                select pets.*
                from connections inner join pets on pet_id = pets.id
                where \"Pet_Visible\" = true and \"Connection_Type\" = 'Adoptar';
            ")
    end
    
end
