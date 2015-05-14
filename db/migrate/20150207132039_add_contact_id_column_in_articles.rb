class AddContactIdColumnInArticles < ActiveRecord::Migration
  def change
    add_column :articles, :contact_id, :integer
  end
end