require 'bundler'
Bundler.require

require_relative 'config.rb'

get '/' do
  $p = Pry.new
  haml :index
end

post '/' do
  code = params[:code]

  $q = $p
  stderr_stream = capture(:stderr) { $p.eval(code) }
  stdout_stream = capture(:stdout) { $q.eval(code) }

  if !stderr_stream.empty?
    return stderr_stream
  elsif !stdout_stream.empty?
    return stdout_stream
  elsif !$p.instance_variable_get("@eval_string").empty?
    return "* " + code
  else
    return code
  end
end

