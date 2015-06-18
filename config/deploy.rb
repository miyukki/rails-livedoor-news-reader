lock '3.4.0'

set :application, 'livedoor_news_reader'
set :repo_url, 'git@github.com:miyukki/rails-livedoor-news-reader.git'
set :scm, :git

set :rvm_type, :system
set :rvm_ruby_version, '2.2.1'

set :format, :pretty
set :log_level, :debug
set :rails_env, :production
set :keep_releases, 5

set :linked_files, %w{config/secrets.yml config/twitter.yml}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
