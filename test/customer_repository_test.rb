require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/customer_repository"
# require "../lib/customer_parser"
require_relative "../lib/sales_engine"

class CustomerRepositoryTest < Minitest::Test

  attr_reader :se

  def setup
    @fake_data = [
      {"id" => "1","first_name" => "Joe","last_name" => "Johnson", "created_at" => "2012", "updated_at" => "2013"},
      {"id" => "2","first_name" => "Jane","last_name" => "Ondricka", "created_at" => "2013", "updated_at" => "2014"},
      {"id" => "3","first_name" => "Bill","last_name" => "Toy", "created_at" => "2012", "updated_at" => "2013"},
      {"id" => "4","first_name" => "Nancy","last_name" => "Son", "created_at" => "2012", "updated_at" => "2013"},
      {"id" => "5","first_name" => "Spock","last_name" => "Bob", "created_at" => "2012", "updated_at" => "2013"}
      ]

    @se = Minitest::Mock.new
  end

  def customer_repo
    CustomerRepository.new(@fake_data, se)
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new
    repo = CustomerRepository.new(@fake_data, engine)
    assert_equal engine, repo.sales_engine
  end

  def test_all
    repo = CustomerRepository.new(@fake_data, SalesEngine.new)
    assert_equal repo.customers, repo.all
  end

  def test_random_one
    repo = CustomerRepository.new(@fake_data, SalesEngine.new)
    assert_equal Customer, repo.random.class
  end

  def test_find_by_id
    assert_equal "Johnson", customer_repo.find_by_id("1").last_name
  end

  def test_find_by_first_name
    assert_equal "5", customer_repo.find_by_first_name("Spock").id
  end

  def test_find_by_last_name
    assert_equal "Bill", customer_repo.find_by_last_name("Toy").first_name
  end

  def test_find_by_created_at
    assert_equal "Ondricka", customer_repo.find_by_created_at("2013").last_name
  end

  def test_find_by_updated_at
    assert_equal "Jane", customer_repo.find_by_updated_at("2014").first_name
  end

  def test_find_all_by_id
    assert_equal 1, customer_repo.find_all_by_id("2").count
  end

  def test_find_all_by_first_name
    assert_equal 1, customer_repo.find_all_by_first_name("Joe").count
  end

  def test_find_all_by_last_name
    assert_equal 1, customer_repo.find_all_by_last_name("Ondricka").count
  end

  def test_find_all_by_created_at
    assert_equal 4, customer_repo.find_all_by_created_at("2012").count
  end

  def test_find_all_by_updated_at
    assert_equal 1, customer_repo.find_all_by_updated_at("2014").count
  end
end
