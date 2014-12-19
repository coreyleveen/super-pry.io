require 'bundler'
Bundler.require

get '/' do
  @@p = Pry.new
  haml :index
end

post '/' do
  content_type :json
  code = params[:code]

  def capture_stdout
    begin
      old_stdout = $stdout
      $stdout = StringIO.new('','w')
      yield
      $stdout.string
    ensure
      $stdout.close
      $stdout = old_stdout
    end
  end

  output = capture_stdout { @@p.eval(code) }

  puts output
end

