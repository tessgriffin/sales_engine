require 'minitest/autorun'
require 'minitest/pride'
require "../lib/customer"

class CustomerTest < Minitest::Test
  def test_it_exists
    assert Customer
  end

  def test_it_has_an_id
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "1", customer.id
  end

  def test_it_has_a_first_name
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "customer first_name", customer.first_name
  end

  def test_it_has_a_last_name
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "customer last_name", customer.last_name
  end

  def test_it_has_a_created_at
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", customer.created_at
  end

  def test_it_has_an_updated_at
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", customer.updated_at
  end
end
