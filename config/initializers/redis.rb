require 'redis'

if Rails.env.development?
  REDIS_CLIENT = Redis.new(url: 'redis://localhost:6379')
else
  REDIS_CLIENT = Redis.new(url: ENV['REDIS_URL'])
end
