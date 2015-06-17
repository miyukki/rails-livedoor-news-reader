module TwitterClient
  TWITTER_CONFIG = YAML.load(File.open(Rails.root.join('config', 'twitter.yml')))

  def twitter_client
    @twitter_client ||=
      twitter = Twitter::REST::Client.new do |config|
        config.consumer_key = TWITTER_CONFIG[:consumer_key]
        config.consumer_secret = TWITTER_CONFIG[:consumer_secret]
        config.access_token = TWITTER_CONFIG[:access_token]
        config.access_token_secret = TWITTER_CONFIG[:access_token_secret]
      end
  end
end
