class Article < ActiveRecord::Base
  belongs_to :issue
  belongs_to :contact
  has_many :comments
  has_many :article_files

  has_paper_trail  :on => [:update]

  validates :title, :deadline, presence: true

  attr_accessor :magazine_id

  def contributer_name(id)
    user = User.find(id).name
    user.present? ? user : ""
  end
end