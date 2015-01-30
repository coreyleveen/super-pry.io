require 'bundler'
Bundler.require

require_relative 'config.rb'

module Kernel
  def `(*)
    "NOT allowed sonny! ;)"
  end
end

Kernel.freeze

get '/' do
  $p = Pry.new
  haml :index
end

post '/' do
  code = params[:code]

  process_command(code)
end

def process_command(code)
  old_output_size = $p.output_array.size

  stdout_stream = capture(:stdout) { $p.eval(code) }

  new_output_size = $p.output_array.size

  if !$p.eval_string.empty?
    "*"
  elsif new_output_size != old_output_size
    $p.output_array[-1].inspect
  elsif stdout_stream
    stdout_stream
  end
end
