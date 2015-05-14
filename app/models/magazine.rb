class Magazine < ActiveRecord::Base
  validates :title, uniqueness: true

  has_many :issues
end
