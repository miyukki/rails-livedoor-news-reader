class Article < ActiveRecord::Base
  include TwitterClient

  belongs_to :category
  has_many :tweets, class_name: ArticleTweet

  validates :category_id, presence: true
  validates :url, uniqueness: { scope: :category_id }

  scope :recent, -> { order('created_at DESC') }

  def load_tweets
    results = twitter_client.search(self.url, count: 100, result_type: 'recent')
    results.each do |status|
      ArticleTweet.create(article: self, tweet_id: status.id, user_id: status.user.id, posted_at: status.created_at)
    end
  end

  def related_articles(num)
    user_ids = tweets.map(&:user_id)
    article_stats = ArticleTweet.where.not(article: self).where(user_id: user_ids)
      .group(:article_id).order('count_user_id desc').count('user_id')

    return [] if article_stats.blank?

    Article.recent.where(id: article_stats.keys.first(num))
  end
end
