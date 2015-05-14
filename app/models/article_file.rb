class ArticleFile < ActiveRecord::Base
  require "open-uri"
  belongs_to :article

  has_attached_file :article_file, :styles => { :medium => "300x300>", :thumb => "80x80>", :pdf_thumbnail => ["", :jpg] },
                    :url => "articles/:id/:style/:basename.:extension",
                    :path => ":rails_root/app/assets/images/articles/:id/:style/:basename.:extension"

  #validates_attachment_content_type :article_file, :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :article_file,content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif',
                                                                 'application/pdf', 'application/msword',
                                                                 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']

  def article_file_from_url(url)
    self.article_file = open(url)
  end



end
