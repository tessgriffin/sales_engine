require_relative 'test_helper'
require_relative "../lib/customer"
require_relative "../lib/sales_engine"

class CustomerTest < Minitest::Test
  def test_it_exists
    assert Customer
  end

  def test_it_has_an_id
    customer = Customer.new(1, "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal 1, customer.id
  end

  def test_it_has_a_first_name
    customer = Customer.new(1, "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "customer first_name", customer.first_name
  end

  def test_it_has_a_last_name
    customer = Customer.new(1, "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "customer last_name", customer.last_name
  end

  def test_it_has_a_created_at
    customer = Customer.new(1, "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", customer.created_at
  end

  def test_it_has_an_updated_at
    customer = Customer.new(1, "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", customer.updated_at
  end

  def test_it_has_a_customer_repository
    customer = Customer.new(1, "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "repository", customer.repo
  end

  def test_it_can_talk_to_parent_invoices_method
    parent = Minitest::Mock.new
    customer = Customer.new(1, "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", parent)
    parent.expect(:find_invoices, [1, 2], [1])
    assert_equal [1, 2], customer.invoices
    parent.verify
  end

  def test_favorite_merchant
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    assert_equal "Shields, Hirthe and Smith", sales_engine.customer_repository.customers[1].favorite_merchant.name    
  end

  def test_transactions_for_customer
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    assert_equal 7, sales_engine.customer_repository.customers[2].transactions.size
  end
end
