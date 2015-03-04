require 'minitest/autorun'
require 'minitest/pride'
require '../lib/invoice_items_parser'

class InvoiceItemsParserTest < Minitest::Test

  def test_it_exists
    assert InvoiceItemsParser
  end

  def test_it_returns_array_of_one_item
    invoice_items = InvoiceItemsParser.new
    output = invoice_items.call("../data/fake_invoice_items.csv")
    assert output
  end

  def test_it_returns_array_of_2_items
    invoice_items = InvoiceItemsParser.new
    output = invoice_items.call("../data/fake_invoice_items.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_21687_items
    invoice_items = InvoiceItemsParser.new
    output = invoice_items.call("../data/invoice_items.csv")
    assert_equal 21687, output.count
  end

end
