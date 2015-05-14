class AddMagazineIdColumnToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :magazine_id, :integer
  end
end
