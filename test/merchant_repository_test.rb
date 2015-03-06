require_relative 'test_helper'
require_relative "../lib/merchant_repository"
require_relative "../lib/sales_engine"

class MerchantRepositoryTest < Minitest::Test

  attr_reader :se

  def setup
    @fake_data = [
      {"id" => "1","name" => "Joe", "created_at" => "2012", "updated_at" => "2013"},
      {"id" => "2","name" => "Jane", "created_at" => "2013", "updated_at" => "2014"},
      {"id" => "3","name" => "Bill", "created_at" => "2012", "updated_at" => "2013"},
      {"id" => "4","name" => "Nancy", "created_at" => "2012", "updated_at" => "2013"},
      {"id" => "5","name" => "Spock", "created_at" => "2012", "updated_at" => "2013"}
      ]

    @se = Minitest::Mock.new
  end

  def merchant_repo
    MerchantRepository.new(@fake_data, @se)
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new
    repo = MerchantRepository.new(@fake_data, engine)
    assert_equal engine, repo.sales_engine
  end

  def test_all
    repo = MerchantRepository.new(@fake_data, SalesEngine.new)
    assert_equal repo.merchants, repo.all
  end

  def test_random_one
    repo = MerchantRepository.new(@fake_data, SalesEngine.new)
    assert_equal Merchant, repo.random.class
  end

  def test_find_by_id
    assert_equal "Joe", merchant_repo.find_by_id("1").name
  end

  def test_find_by_name
    assert_equal "5", merchant_repo.find_by_name("Spock").id
  end

  def test_find_by_created_at
    assert_equal "Jane", merchant_repo.find_by_created_at("2013").name
  end

  def test_find_by_updated_at
    assert_equal "Jane", merchant_repo.find_by_updated_at("2014").name
  end

  def test_find_all_by_id
    assert_equal 1, merchant_repo.find_all_by_id("2").count
  end

  def test_find_all_by_name
    assert_equal 1, merchant_repo.find_all_by_name("Spock").count
  end

  def test_find_all_by_created_at
    assert_equal 4, merchant_repo.find_all_by_created_at("2012").count
  end

  def test_find_all_by_updated_at
    assert_equal 1, merchant_repo.find_all_by_updated_at("2014").count
  end

  def test_it_can_talk_to_parent_for_items
    parent = Minitest::Mock.new
    repo = MerchantRepository.new(@fake_data, parent)
    parent.expect(:find_items_by_merchant_id, [1, 2], ["1"])
    assert_equal [1, 2], repo.find_items("1")
    parent.verify
  end




end
