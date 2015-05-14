class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    Role.new(name: "Admin").save
    Role.new(name: "Editorial").save
    Role.new(name: "Graphics").save
    Role.new(name: "Sales").save
    Role.new(name: "Production").save
    Role.new(name: "Photographer").save
    Role.new(name: "Client").save
  end
end
