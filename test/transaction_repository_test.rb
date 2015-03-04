require 'minitest/autorun'
require 'minitest/pride'
require "../lib/transaction_repository"
require "../lib/transaction_parser"

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

  def test_find_by_id
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "4844518708741275", transaction_repository.find_by_id("5").credit_card_number
  end

  def test_find_by_invoice_id
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "4654405418249632", transaction_repository.find_by_invoice_id("1").credit_card_number
  end

  def test_find_by_credit_card_number
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "2", transaction_repository.find_by_credit_card_number("4580251236515201").id
  end

  def test_find_by_credit_card_expiration_date
    parser = TransactionParser.new
    transaction_array = parser.call("../data/fake_transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "56", transaction_repository.find_by_credit_card_expiration_date("2016-03-15").invoice_id
  end

  #---------------------------

  def test_find_by_result
    parser = TransactionParser.new
    transaction_array = parser.call("../data/fake_transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "1", transaction_repository.find_by_result("success").id
    assert_equal "2", transaction_repository.find_by_result("failure").id
  end

  def test_find_by_created_at
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "1", transaction_repository.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_by_updated_at
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "1", transaction_repository.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_all_by_id
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal 1, transaction_repository.find_all_by_id("16").count
  end

  def test_find_all_by_invoice_id
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal 1, transaction_repository.find_all_by_invoice_id("1").count
  end

  def test_find_all_by_credit_card_number
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "7", transaction_repository.find_all_by_credit_card_number("4801647818676136").first.id
  end

  def test_find_all_by_credit_card_expiration_date
    parser = TransactionParser.new
    transaction_array = parser.call("../data/fake_transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal "85", transaction_repository.find_all_by_credit_card_expiration_date("2016-03-16").first.invoice_id
  end

  def test_find_all_by_result
    parser = TransactionParser.new
    transaction_array = parser.call("../data/fake_transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal 3, transaction_repository.find_all_by_result("success").count
    assert_equal 1, transaction_repository.find_all_by_result("failure").count
  end

  def test_find_all_by_created_at
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal 2, transaction_repository.find_all_by_created_at("2012-03-27 14:54:09 UTC").count
  end

  def test_find_all_by_updated_at
    parser = TransactionParser.new
    transaction_array = parser.call("../data/transactions.csv")
    transaction_repository = TransactionRepository.new(transaction_array)
    assert_equal 2, transaction_repository.find_all_by_updated_at("2012-03-27 14:54:09 UTC").count
  end
end
