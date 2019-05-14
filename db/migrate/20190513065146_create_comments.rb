class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :Comment_Comment
      t.references :pet
      t.references :pet_lost
      t.references :post

      t.timestamps
    end
  end
end
