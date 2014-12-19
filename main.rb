require 'bundler'
Bundler.require

require_relative 'config.rb'

get '/' do
  @@p = Pry.new
  haml :index
end

post '/' do

  stdout_stream = capture(:stdout)
  stream
  binding.pry
  # content_type :json
  # code = params[:code]

  # def capture_stdout
  #   begin
  #     old_stdout = $stdout
  #     $stdout = StringIO.new('','w')
  #     yield
  #     $stdout.string
  #   ensure
  #     $stdout = old_stdout
  #   end
  # end

  # output = capture_stdout { @@p.eval(code) }

  # puts output
end

