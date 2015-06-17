class Article < ActiveRecord::Base
  include TwitterClient

  has_many :tweets, class_name: ArticleTweet

  def load_tweets
    results = twitter_client.search(self.url, count: 100, result_type: 'recent')
    results.each do |status|
      ArticleTweet.create(article: self, tweet_id: status.id, user_id: status.user.id, posted_at: status.created_at)
    end
  end
end
