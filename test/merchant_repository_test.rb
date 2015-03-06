require_relative 'test_helper'
require_relative "../lib/merchant_repository"
require_relative "../lib/merchant_parser"

class MerchantRepositoryTest < Minitest::Test
  def merchant_parser
    MerchantParser.new.call("./data/merchants.csv")
  end

  def merchant_repo
    MerchantRepository.new(merchant_parser)
  end

  def test_all
    array_fake_merchants = Object.new
    merchant_repository = MerchantRepository.new(array_fake_merchants)
    assert_equal array_fake_merchants, merchant_repository.all
  end

  def test_random_empty
    array_fake_merchants = []
    merchant_repository = MerchantRepository.new(array_fake_merchants)
    assert_equal nil, merchant_repository.random
  end

  def test_random_one
    fake_merchant = Object.new
    array_fake_merchants = [fake_merchant]
    merchant_repository = MerchantRepository.new(array_fake_merchants)
    assert_equal fake_merchant, merchant_repository.random
  end  

  def test_find_by_id
    assert_equal "Bernhard-Johns", merchant_repo.find_by_id("7").name
  end  

  def test_find_by_id_where_id_does_not_exist
    assert_equal nil, merchant_repo.find_by_id("101")
  end

  def test_find_by_name
    assert_equal "84", merchant_repo.find_by_name("Terry-Moore").id
  end   

  def test_find_by_created_at
    assert_equal "1", merchant_repo.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_by_updated_at
    assert_equal "1", merchant_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end  

  def test_find_all_by_id
    assert_equal 1, merchant_repo.find_all_by_id("7").count
  end

  def test_find_all_by_name
    assert_equal 2, merchant_repo.find_all_by_name("Williamson Group").count
  end  

  def test_find_all_by_created_at
    assert_equal 9, merchant_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").count
  end  

  def test_find_all_by_updated_at
    assert_equal 12, merchant_repo.find_all_by_updated_at("2012-03-27 14:54:00 UTC").count
  end          
end
