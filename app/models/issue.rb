class Issue < ActiveRecord::Base
  belongs_to :magazine
  has_many :articles
  has_many :comments

  has_attached_file :cover_image, :styles => { :medium => "300x300>", :thumb => "128x128>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :pdf_file_name
  validates_attachment :pdf_file_name, :content_type =>
      { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  validates :name, :print_deadline, presence: true


end
