require 'minitest/autorun'
require './main'

describe 'decolor' do
  it 'removes light cyan' do
    str = "=> \e[1;36m"
    decolor(str).must_equal ""
  end

  it 'removes yellow' do
    str = "=> \e[33m"
    decolor(str).must_equal ""
  end

  it 'removes green' do
    str = "[32m"
    decolor(str).must_equal ""
  end

  it 'removes blue' do
    str = "[1;34m"
    decolor(str).must_equal ""
  end

  it 'removes light red' do
    str = "[;31m"
    decolor(str).must_equal ""
  end

  it 'removes red' do
    str = "[31m"
    decolor(str).must_equal ""
  end

  it 'removes trailing characters' do
    str = "\e[0m"
    decolor(str).must_equal ""
  end

  it 'removes light blue' do
    str = "[1;34;4m"
    decolor(str).must_equal ""
  end
end
