require 'minitest/autorun'
require 'minitest/pride'
require '../lib/customer_parser'

class CustomerParserTest < Minitest::Test

  def test_it_exists
    assert CustomerParser
  end

  def test_it_returns_array_of_one_item
    customer = CustomerParser.new
    output = customer.call("../data/fake_customers.csv")
    assert output
  end

  def test_it_returns_array_of_multiple_items
    customer = CustomerParser.new
    output = customer.call("../data/fake_customers.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_all_items
    customer = CustomerParser.new
    output = customer.call("../data/customers.csv")
    assert_equal 1000, output.count
  end

end
