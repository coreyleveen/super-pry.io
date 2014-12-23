require 'bundler'
Bundler.require

require_relative 'config.rb'

get '/' do
  $p = Pry.new
  @output = ""
  haml :index
end

post '/' do

  code = params[:code]
  $p.eval(code)

  if $p.instance_variable_get(:@eval_string).empty?
    @output = $p.instance_variable_get(:@outcome).inspect
  end
  return @output.to_s

end

