require 'bundler'
Bundler.require

get '/' do
  @@p = Pry.new
  haml :index
end

post '/' do
  code = params[:code]
  @@p.eval(code)
  if @@p.instance_variable_get("@last_result_is_exception")
    @@p.instance_variable_get("@last_exception").inspect.to_s
  elsif @@p.instance_variable_get("@eval_string").empty?
    @@p.output_array[-1].to_json
  else
   ("*" + @@p.instance_variable_get("@eval_string")).to_json
  end
end
