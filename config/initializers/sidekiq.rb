redis_url = "redis://" + Rails.configuration.engin['redis_server']
redis_url = redis_url + ":" + Rails.configuration.engin['redis_port'].to_s
redis_url = redis_url + "/" + Rails.configuration.engin['redis_db'].to_s

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end