require 'bundler'
Bundler.require

require_relative 'config.rb'

enable :sessions

get '/' do
  $p = Pry.new
  haml :index
end

post '/' do
  process_command(code: params[:code])
end

def process_command(code:)
  old_output_size = $p.output_array.size
  stdout_stream = capture(:stdout) { $p.eval(code) }
  new_output_size = $p.output_array.size
  handle_eval_string(old_output_size, new_output_size)
end

def handle_eval_string(old_output_size, new_output_size)
  if !$p.eval_string.empty?
    "*"
  elsif new_output_size != old_output_size
    $p.output_array[-1].inspect
  elsif stdout_stream
    stdout_stream
  end
end
