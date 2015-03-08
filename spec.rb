require 'minitest/autorun'
require './main'

describe 'decolor' do
  it 'removes light cyan' do
    cyan_str = "=> \e[1;36m"
    decolor(cyan_str).must_equal ""
  end

  it 'removes yellow' do
    yellow_str = "=> \e[33m"
    decolor(yellow_str).must_equal ""
  end

  it 'removes green' do
    green_str = "[32m"
    decolor(green_str).must_equal ""
  end

  it 'removes blue' do
    blue_str = "[1;34m"
    decolor(blue_str).must_equal ""
  end

  it 'removes light red' do
    light_red_str = "[;31m"
    decolor(light_red_str).must_equal ""
  end

  it 'removes red' do
    red_str = "[31m"
    decolor(red_str).must_equal ""
  end

  it 'removes trailing characters' do
    str = "\e[0m"
    decolor(str).must_equal ""
  end
end
