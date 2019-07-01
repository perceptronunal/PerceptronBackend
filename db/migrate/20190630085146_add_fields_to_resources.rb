class AddFieldsToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :filename, :string
    add_column :resources, :bytesize, :integer
  end
end
