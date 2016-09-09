class Comment < ActiveRecord::Base
  belongs_to :article

  validates :text, :user, :article_id, :presence => true
end
