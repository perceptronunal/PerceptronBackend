class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :Comment_Comment
      t.references :commenteable, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
