require 'minitest/autorun'
require 'minitest/pride'
require '../lib/merchant_parser'

class MerchantParserTest < Minitest::Test

  def test_it_exists
    assert MerchantParser
  end

  def test_it_returns_array_of_one_item
    merchant = MerchantParser.new
    output = merchant.call("../data/fake_merchants.csv")
    assert output
  end

  def test_it_returns_array_of_multiple_items
    merchant = MerchantParser.new
    output = merchant.call("../data/fake_merchants.csv")
    assert_equal 6, output.count
  end

  def test_it_returns_array_of_all_items
    merchant = MerchantParser.new
    output = merchant.call("../data/merchants.csv")
    assert_equal 100, output.count
  end

end