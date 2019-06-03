class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :Post_Title
      t.text :Post_Content
      t.string :Post_Tag
      t.references :organization

      t.timestamps
    end
  end
end
