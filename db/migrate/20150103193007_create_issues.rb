class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :image
      t.string :pdf_file_name
      t.string :print_deadline

      t.timestamps
    end
  end
end
