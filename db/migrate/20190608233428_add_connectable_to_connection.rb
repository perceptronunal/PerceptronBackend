class AddConnectableToConnection < ActiveRecord::Migration[5.2]
  def change
    add_reference :connections, :connectable, polymorphic: true
  end
end
