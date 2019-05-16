class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :Resource_Type
      t.string :Resource_Link
      t.references :resourceable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
