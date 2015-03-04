require 'minitest/autorun'
require 'minitest/pride'
require "../lib/transaction_repository"

class TransactionRepositoryTest < Minitest::Test
  def test_all
    array_fake_transactions = Object.new
    transaction_repository = TransactionRepository.new(array_fake_transactions)
    assert_equal array_fake_transactions, transaction_repository.all
  end

  def test_random_empty
    array_fake_transactions = []
    transaction_repository = TransactionRepository.new(array_fake_transactions)
    assert_equal nil, transaction_repository.random
  end

  def test_random_one
    fake_transaction = Object.new
    array_fake_transactions = [fake_transaction]
    transaction_repository = TransactionRepository.new(array_fake_transactions)
    assert_equal fake_transaction, transaction_repository.random
  end
end
