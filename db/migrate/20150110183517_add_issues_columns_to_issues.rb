class AddIssuesColumnsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :pdf_file_name_file_name,    :string
    add_column :issues, :pdf_file_name_content_type, :string
    add_column :issues, :pdf_file_name_file_size,    :integer
    add_column :issues, :pdf_file_name_updated_at,   :datetime
  end
end
