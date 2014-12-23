require 'bundler'
Bundler.require

require_relative 'config.rb'

get '/' do
  $p = Pry.new
  haml :index
end

post '/' do

  code = params[:code]

  $p.eval(code)

  outcome = $p.instance_variable_get(:@outcome)

  binding.pry

  return outcome

end

