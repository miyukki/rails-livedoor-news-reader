set :branch, 'master'
set :deploy_to, '/var/www/livedoor_news_reader'

set :unicorn_pid, "#{shared_path}/tmp/unicorn.pid"
set :unicorn_config_path, "#{current_path}/config/unicorn/production.rb"

server '160.16.64.33', port: 2022, user: 'admin', roles: %w{web app db}
