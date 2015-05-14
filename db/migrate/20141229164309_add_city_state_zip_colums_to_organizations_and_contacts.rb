class AddCityStateZipColumsToOrganizationsAndContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :city, :string
    add_column :contacts, :state, :string
    add_column :contacts, :zip, :string

    add_column :organizations, :city, :string
    add_column :organizations, :state, :string
    add_column :organizations, :zip, :string
  end
end
