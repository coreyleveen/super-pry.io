require 'stringio'
require 'bundler'
Bundler.require

get '/' do
  @@p = Pry.new
  haml :index
end

post '/' do
  code = params[:code]

  $stdout = StringIO.new

  @@p.eval(code)
  output = $stdout.string

  $stdout = STDOUT

  output_arr = []
  output.each_line('\n') { |line| output_arr << line }

  output_arr[1]

  binding.pry
  # binding.pry
  # # Exception
  # if @@p.instance_variable_get("@last_result_is_exception")
  #   binding.pry
  #   @@p.instance_variable_get("@last_exception").inspect
  # # Ongoing input
  # elsif !@@p.instance_variable_get("@eval_string").empty?
  #   binding.pry
  #   "* " << code
  # # End of input
  # else
  #   binding.pry
  #   if @@p.output_array[-1].class == Symbol
  #     ":" + @@p.output_array[-1].to_s
  #   else
  #     @@p.output_array[-1].to_s
  #   end
  # end
end
