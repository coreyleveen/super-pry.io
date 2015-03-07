require 'minitest/autorun'
require './main'

class MyTest < Minitest::Test
  describe 'decolor' do
    it 'removes light cyan' do
      cyan_str = "=> \e[1;36m"
      decolor(cyan_str).must_equal ""
    end

    it 'removes yellow' do
      yellow_str = "=> \e[33m"
      decolor(yellow_str).must_equal ""
    end

    it 'removes trailing characters' do
      str = "\e[0m"
      decolor(str).must_equal ""
    end
  end
end
