class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :User_Name
      t.string :User_Email
      t.string :User_Phone
      t.string :User_City

      t.timestamps
    end
  end
end
