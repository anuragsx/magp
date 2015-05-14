class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end
