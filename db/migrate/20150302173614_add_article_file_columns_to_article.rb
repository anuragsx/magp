class AddArticleFileColumnsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :article_file_file_name,    :string
    add_column :articles, :article_file_content_type, :string
    add_column :articles, :article_file_file_size,    :integer
    add_column :articles, :article_file_updated_at,   :datetime
  end
end
