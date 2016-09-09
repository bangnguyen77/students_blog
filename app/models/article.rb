class Article < ActiveRecord::Base
  has_many :comments
  validates :title, :author, :points, :presence => true
end
