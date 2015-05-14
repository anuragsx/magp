class CreateArticleFiles < ActiveRecord::Migration
  def change
    create_table :article_files do |t|
      t.string   :article_file_file_name
      t.string   :article_file_content_type
      t.integer   :article_file_file_size
      t.datetime :article_file_updated_at
      t.integer :article_id
      t.timestamps
    end
  end
end
