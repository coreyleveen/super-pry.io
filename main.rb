require 'bundler'
Bundler.require

get '/' do
  haml :index
end

post '/' do
  "Code: #{params[:code]}"
end
