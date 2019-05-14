class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :Resource_Type
      t.string :Resource_Link
      t.references :pet
      t.references :user
      t.references :pet_lost
      t.references :post 
      t.references :organization

      t.timestamps
    end
  end
end
