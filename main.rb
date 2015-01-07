require 'bundler'
Bundler.require

require_relative 'config.rb'

get '/' do
  $p = Pry.new
  haml :index
end

post '/' do
  code = params[:code]

  old_output_size = $p.output_array.size

  stdout_stream = capture(:stdout) { $p.eval(code) }

  new_output_size = $p.output_array.size

  if !$p.eval_string.empty?
    return "* #{code}"
  elsif new_output_size != old_output_size
    return $p.output_array[-1].inspect
  elsif stdout_stream
    return stdout_stream
  else
    return "Nothin!"
  end


end

