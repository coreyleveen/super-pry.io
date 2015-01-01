require 'bundler'
Bundler.require

require_relative 'config.rb'

get '/' do
  $p = Pry.new
  haml :index
end

post '/' do
  code = params[:code]

  stdout_stream = capture(:stdout) { $p.eval(code) }

  if !stdout_stream.empty?
    stdout_stream.inspect
  elsif !$p.instance_variable_get(:@eval_string).empty?
    code
  end
end

