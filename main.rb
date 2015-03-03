require 'bundler'
Bundler.require

require_relative 'config.rb'

get '/' do
  $p = Pry.new
  $q = Pry.new
  haml :index
end

post '/' do
  process_command(input: params[:code])
end

def process_command(input:)
  old_output_size = $p.output_array.size
  stdout_stream = capture(:stdout) { $p.eval(input) }
  stderr_stream = capture(:stderr) { $q.eval(input) }
  new_output_size = $p.output_array.size
  handler(
    old_size: old_output_size,
    new_size: new_output_size,
    stdout: stdout_stream,
    stderr: stderr_stream
  )
end

def handler(options)
  if !$p.eval_string.empty?
    "*"
  elsif options[:new_size] != options[:old_size]
    $p.output_array[-1].inspect
  elsif options[:stdout_stream]
    options[:stdout_stream]
  else
    options[:stderr_stream]
  end
end
