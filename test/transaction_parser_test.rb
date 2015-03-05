require 'minitest/autorun'
require 'minitest/pride'
require '../lib/transaction_parser'

class TransactionParserTest < Minitest::Test

  def test_it_exists
    assert TransactionParser
  end

  def test_it_returns_array_of_one_item
    transactions = TransactionParser.new
    output = transactions.call("../data/fake_transactions.csv")
    assert output
  end

  def test_it_returns_array_of_2_items
    transactions = TransactionParser.new
    output = transactions.call("../data/fake_transactions.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_all_items
    transactions = TransactionParser.new
    output = transactions.call("../data/transactions.csv")
    assert_equal 5595, output.count
  end

end
