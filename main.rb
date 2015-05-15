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
  stdout_stream = capture(:stdout) { $p.eval input }
  stderr_stream = capture(:stderr) { $q.eval input }
  handle_input(stdout_stream, stderr_stream)
end

def handle_input(stdout, stderr)
  if !$p.eval_string.empty?
    "*"
  elsif stdout && !stdout.empty?
    decolor(stdout)
  else
    decolor(stderr)
  end
end

def decolor(str)
  color_regexes.each { |rgx| str.gsub!(rgx, "") }
  return str
end

def color_regexes
  [
    /=> \e\[1;36m/,
    /\e\[0m/,
    /=> \e\[33m/,
    /\[32m/,
    /\[1;34m/,
    /\[;31m/,
    /\[1;31m/,
    /\[31m/,
    /\[1;34;4m/,
    /\[1;35m/
  ]
end
