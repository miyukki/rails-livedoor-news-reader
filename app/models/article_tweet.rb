class ArticleTweet < ActiveRecord::Base
  belongs_to :article

  validates :tweet_id, presence: true, uniqueness: true
  validates :article_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  validates :posted_at, presence: true
end
