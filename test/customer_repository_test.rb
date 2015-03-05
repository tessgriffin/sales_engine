require 'minitest/autorun'
require 'minitest/pride'
require "../lib/customer_repository"
require "../lib/customer_parser"
require "../lib/sales_engine"

class CustomerRepositoryTest < Minitest::Test
  def customer_parser
    CustomerParser.new.call("../data/customers.csv")
  end

  def sales_engine
    SalesEngine.new
  end

  def customer_repo
    CustomerRepository.new(customer_parser, sales_engine)
  end

  def test_all
    array_fake_customers = Object.new
    customer_repository = CustomerRepository.new(array_fake_customers, sales_engine)
    assert_equal array_fake_customers, customer_repository.all
  end

  def test_random_empty
    array_fake_customers = []
    customer_repository = CustomerRepository.new(array_fake_customers, sales_engine)
    assert_equal nil, customer_repository.random
  end

  def test_random_one
    fake_customer = Object.new
    array_fake_customers = [fake_customer]
    customer_repository = CustomerRepository.new(array_fake_customers, sales_engine)
    assert_equal fake_customer, customer_repository.random
  end

  def test_find_by_id
    assert_equal "Witting", customer_repo.find_by_id("47").last_name
  end

  def test_find_by_first_name
    assert_equal "5", customer_repo.find_by_first_name("Sylvester").id
  end

  def test_find_by_last_name
    assert_equal "Loyal", customer_repo.find_by_last_name("Considine").first_name
  end

  def test_find_by_created_at
    assert_equal "Ondricka", customer_repo.find_by_created_at("2012-03-27 14:54:09 UTC").last_name
  end

  def test_find_by_updated_at
    assert_equal "Joey", customer_repo.find_by_updated_at("2012-03-27 14:54:09 UTC").first_name
  end

  def test_find_all_by_id
    assert_equal 1, customer_repo.find_all_by_id("16").count
  end

  def test_find_all_by_first_name
    assert_equal 1, customer_repo.find_all_by_first_name("Cecilia").count
  end

  def test_find_all_by_last_name
    assert_equal 3, customer_repo.find_all_by_last_name("Nader").count
  end

  def test_find_all_by_created_at
    assert_equal 1, customer_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC").count
  end

  def test_find_all_by_updated_at
    assert_equal 1, customer_repo.find_all_by_updated_at("2012-03-27 14:54:09 UTC").count
  end
end
