require 'sinatra'
require 'redis'

UNLOCKER_HOST = 'unlocker-web.herokuapp.com'

redis = Redis.new(password: ENV['REDIS_URL'])

get '/' do
  redirect "http://#{UNLOCKER_HOST}/authenticate" if request.host != UNLOCKER_HOST
end

get '/authenticate' do
  erb :authenticate
end

post '/authenticate' do
  redis.setex(request.ip, 10, true)
  "Yay!"  
end
