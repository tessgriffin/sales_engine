require_relative 'test_helper'
require_relative '../lib/parser'

class ParserTest < Minitest::Test
  def test_it_exists
    assert Parser
  end

  def test_it_returns_array_of_multiple_customers
    output = Parser.call("./data/fake_customers.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_all_customers
    output = Parser.call("./data/customers.csv")
    assert_equal 1000, output.count
  end

  def test_it_returns_array_of_multiple_invoice_items
    output = Parser.call("./data/fake_invoice_items.csv")
    assert_equal 12, output.count
  end

  def test_it_returns_array_of_all_invoice_items
    output = Parser.call("./data/invoice_items.csv")
    assert_equal 21687, output.count
  end

  def test_it_returns_array_of_multiple_invoices
    output = Parser.call("./data/fake_invoices.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_all_invoices
    output = Parser.call("./data/invoices.csv")
    assert_equal 4843, output.count
  end

  def test_it_returns_array_of_multiple_items
    output = Parser.call("./data/fake_items.csv")
    assert_equal 9, output.count
  end

  def test_it_returns_array_of_all_items
    output = Parser.call("./data/items.csv")
    assert_equal 2483, output.count
  end

  def test_it_returns_array_of_multiple_merchants
    output = Parser.call("./data/fake_merchants.csv")
    assert_equal 6, output.count
  end

  def test_it_returns_array_of_all_merchants
    output = Parser.call("./data/merchants.csv")
    assert_equal 100, output.count
  end

  def test_it_returns_array_of_multiple_transactions
    output = Parser.call("./data/fake_transactions.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_all_transactions
    output = Parser.call("./data/transactions.csv")
    assert_equal 5595, output.count
  end
end
