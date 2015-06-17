class Category < ActiveRecord::Base
  has_many :articles

  def load_articles
    require 'rss'
    rss = RSS::Parser.parse(open(self.rss_url))
    rss.items.each do |item|
      Article.create(category: self, title: item.title, description: item.description, url: item.link, created_at: item.pubDate)
    end
  end
end
