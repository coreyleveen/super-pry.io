require 'bundler'
Bundler.require

get '/' do
  @@p = Pry.new
  haml :index
end

post '/' do
  code = params[:code]
  @@p.eval(code)

  # Exception
  if @@p.instance_variable_get("@last_result_is_exception")
    @@p.instance_variable_get("@last_exception").inspect
  # Ongoing input
  elsif !@@p.instance_variable_get("@eval_string").empty?
    "* " << code
  # End of input
  else
    if @@p.output_array[-1].class == Symbol
      ":" + @@p.output_array[-1].to_s
    else
      @@p.output_array[-1].to_s
    end
  end
end
