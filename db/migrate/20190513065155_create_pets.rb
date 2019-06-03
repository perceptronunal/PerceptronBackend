class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :Pet_Type
      t.string :Pet_Name
      t.string :Pet_Gender
      t.integer :Pet_Age
      t.string :Pet_Size
      t.string :Pet_Color
      t.boolean :Pet_Sterilized
      t.boolean :Pet_Vaccinated
      t.text :Pet_Description
      t.boolean :Pet_Visible

      t.timestamps
    end
  end
end
