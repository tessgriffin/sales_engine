require_relative 'test_helper'
require_relative "../lib/customer"
require_relative "../lib/customer_parser"
require_relative "../lib/customer_repository"
require_relative "../lib/invoice_repository"
require_relative "../lib/sales_engine"

class CustomerTest < Minitest::Test
  # def setup
  #   engine = SalesEngine.new
  #   @se = engine.startup
  # end

  def test_it_exists
    assert Customer
  end

  def test_it_has_an_id
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "1", customer.id
  end

  def test_it_has_a_first_name
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "customer first_name", customer.first_name
  end

  def test_it_has_a_last_name
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "customer last_name", customer.last_name
  end

  def test_it_has_a_created_at
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", customer.created_at
  end

  def test_it_has_an_updated_at
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", customer.updated_at
  end

  def test_it_has_a_customer_repository
    customer = Customer.new("1", "customer first_name", "customer last_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "repository", customer.repo
  end

  def test_invoices_method
    # skip
    engine = SalesEngine.new
    engine_loaded = engine.startup
    repository = engine_loaded.customer_repository
    # parser = CustomerParser.call("./data/customers.csv")
    # repository = CustomerRepository.new(parser, @se)
    customer = Customer.new("1", "Joey", "Ondricka", "2012-03-27 14:54:09 UTC", "2012-03-27 14:54:09 UTC", repository)
    assert_equal nil, customer.invoices(customer.id)
  end
end
