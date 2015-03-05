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
  stdout_stream = capture(:stdout) { $p.eval(input) }
  stderr_stream = capture(:stderr) { $q.eval(input) }
  handler(stdout_stream, stderr_stream)
end

def handler(stdout, stderr)
  if !$p.eval_string.empty?
    "*"
  elsif stdout
    stdout
  else
    stderr
  end
end
