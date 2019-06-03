class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :Organization_Name
      t.string :Organization_Address
      t.string :Organization_Phone
      t.string :Organization_Email
      t.string :Organization_Website
      t.string :Organization_Description
      t.boolean :Organization_Validation
      t.string :password_digest

      t.timestamps
    end
  end
end
