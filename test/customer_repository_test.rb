require 'minitest/autorun'
require 'minitest/pride'
require "../lib/customer_repository"
require "../lib/customer_parser"

class CustomerRepositoryTest < Minitest::Test
  def test_all
    array_fake_customers = Object.new
    customer_repository = CustomerRepository.new(array_fake_customers)
    assert_equal array_fake_customers, customer_repository.all
  end

  def test_random_empty
    array_fake_customers = []
    customer_repository = CustomerRepository.new(array_fake_customers)
    assert_equal nil, customer_repository.random
  end

  def test_random_one
    fake_customer = Object.new
    array_fake_customers = [fake_customer]
    customer_repository = CustomerRepository.new(array_fake_customers)
    assert_equal fake_customer, customer_repository.random
  end

  def test_find_by_id
    parser = CustomerParser.new
    customer_array = parser.call("../data/customers.csv")
    customer_repository = CustomerRepository.new(customer_array)
    assert_equal "Witting", customer_repository.find_by_id("47").last_name
  end
end
