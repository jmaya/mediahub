# web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq
redis: redis-server
