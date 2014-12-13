require 'json'
require 'bundler'
Bundler.require

get '/' do
  haml :index
end

post '/.json' do
  content_type :json
  output = params[:code] + "- sinatra"
  output.to_json
end
