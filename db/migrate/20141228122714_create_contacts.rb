class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email
      t.integer :organization_id

      t.timestamps
    end
    u = User.new(first_name: "admin", last_name: "admin", email: "anuraag.jpr@gmail.com", password: "admin123", password_confirmation: "admin123")
    u.save
  end
end
