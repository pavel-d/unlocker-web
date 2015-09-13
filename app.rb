require 'sinatra'
require 'redis'

UNLOCKER_HOST = '46.101.255.49'

redis = Redis.new

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
