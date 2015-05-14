class AddArticleTextColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_text, :text
  end
end
