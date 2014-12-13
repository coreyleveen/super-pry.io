require 'bundler'
Bundler.require
require 'json'
require 'pry'

get '/' do
  haml :index
end

post '/' do
  content_type :json
  binding.pry
  haml :index
end
