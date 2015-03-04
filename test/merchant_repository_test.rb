require 'minitest/autorun'
require 'minitest/pride'
require "../lib/merchant_repository"

class MerchantRepositoryTest < Minitest::Test
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
end
