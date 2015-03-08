require_relative 'test_helper'
require_relative '../lib/transaction_parser'

class TransactionParserTest < Minitest::Test

  def test_it_exists
    assert TransactionParser
  end

  def test_it_returns_array_of_multiple_items
    output = TransactionParser.call("./data/fake_transactions.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_all_items
    output = TransactionParser.call("./data/transactions.csv")
    assert_equal 5595, output.count
  end

end
