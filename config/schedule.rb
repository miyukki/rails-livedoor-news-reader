every 10.minutes do
  runner 'Category.refresh_articles!'
end

every 15.minutes do
  runner 'Article.refresh_tweets!'
end
