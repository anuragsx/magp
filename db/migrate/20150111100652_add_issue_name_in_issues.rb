class AddIssueNameInIssues < ActiveRecord::Migration
  def change
    add_column :issues, :name, :string
  end
end
