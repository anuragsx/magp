class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :created_by

      t.timestamps
    end
  end
end
