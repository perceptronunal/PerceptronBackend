class CreateProfilepictures < ActiveRecord::Migration[5.2]
  def change
    create_table :profilepictures do |t|
      t.string :ProfilePicture_Link
      t.string :ProfilePicture_Filename
      t.integer :ProfilePicture_Bytesize
      # t.references :profilepicturesable, polymorphic: true, index: true
      t.references :profilepicturesable, polymorphic: true, index: { name: :my_index }

      t.timestamps
    end
  end
end
