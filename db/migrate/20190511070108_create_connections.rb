class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :Connection_Type
      t.references :pet

      t.timestamps
    end
  end
end
