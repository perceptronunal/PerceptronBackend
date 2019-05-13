class CreateInterestedIns < ActiveRecord::Migration[5.2]
  def change
    create_table :interested_ins do |t|
      t.string :Interest_Type
      t.references :user
      t.references :pet
      
      t.timestamps
    end
  end
end
