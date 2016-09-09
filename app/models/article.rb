class Article < ActiveRecord::Base
  validates :title, :author, :points, :presence => true
end
