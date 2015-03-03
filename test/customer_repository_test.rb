require 'minitest/autorun'
require 'minitest/pride'
require "../lib/customer_repository"

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
end
