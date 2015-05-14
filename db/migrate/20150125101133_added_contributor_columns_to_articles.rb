class AddedContributorColumnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :editor, :string
    add_column :articles, :contributor, :string
    add_column :articles, :photographer, :string
    add_column :articles, :main_contact, :string
    add_column :articles, :copy_complete, :boolean
    add_column :articles, :photo_complete, :boolean
    add_column :articles, :print_ready, :boolean
  end
end
