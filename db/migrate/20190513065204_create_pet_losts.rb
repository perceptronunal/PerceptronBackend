class CreatePetLosts < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_losts do |t|
      t.string :PetLost_Type
      t.string :PetLost_Name
      t.string :PetLost_Gender
      t.string :PetLost_Size
      t.text :PetLost_Description
      t.boolean :PetLost_Found
      t.references :user

      t.timestamps
    end
  end
end
