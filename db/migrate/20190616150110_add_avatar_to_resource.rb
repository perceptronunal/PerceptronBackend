class AddAvatarToResource < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :avatar, :string
  end
end
