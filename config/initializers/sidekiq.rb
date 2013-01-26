uri = URI.parse('redis://localhost:6379')

$redis = ConnectionPool::Wrapper.new(:size => 5, :timeout => 3) { Redis::Namespace.new(:sideslow, :redis => Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)) }


Sidekiq.configure_server do |config|
  config.redis = { :url => $redis_connection_url, :namespace => 'sideslowsidekiq' }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => $redis_connection_url, :namespace => 'sideslowsidekiq', :size => 1 }
end

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    Sidekiq.configure_client do |config|
      config.redis = { :url => $redis_connection_url, :namespace => 'sideslowsidekiq', :size => 1 }
    end if forked
  end
end
