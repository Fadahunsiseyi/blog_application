class User < ApplicationRecord
  has_many :posts
  has_many :likes, through: :posts
  has_many :comments, through: :posts
  validates :name, presence: true

  def recent_posts
    posts.order(created_at: desc).limit(3)
  end
end
