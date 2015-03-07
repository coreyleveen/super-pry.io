require 'minitest/autorun'
require './main'

class MyTest < Minitest::Test
  describe 'decolor' do
    it 'removes light cyan' do
      cyan_str = "=> \e[1;36m"
      decolor(cyan_str).must_equal ""
    end
  end
end
