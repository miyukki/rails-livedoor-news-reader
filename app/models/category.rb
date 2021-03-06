require 'rss'

class Category < ActiveRecord::Base
  has_many :articles

  def self.refresh_articles!
    Category.all.each(&:load_articles!)
  end

  def load_articles!
    rss = RSS::Parser.parse(open(self.rss_url))
    rss.items.each do |item|
      next if Article.where(url: item.link).exists?
      ogp = OpenGraph.new(item.link)
      Article.create(category: self, title: item.title, description: ogp.description, url: item.link, thumbnail_url: ogp.images.first, created_at: item.pubDate)
    end
  end
end
