require_relative 'test_helper'
require_relative '../lib/invoice_items_parser'

class InvoiceItemsParserTest < Minitest::Test

  def test_it_exists
    assert InvoiceItemParser
  end

  def test_it_returns_array_of_one_item
    output = InvoiceItemParser.call("./data/fake_invoice_items.csv")
    assert output
  end

  def test_it_returns_array_of_multiple_items
    output = InvoiceItemParser.call("./data/fake_invoice_items.csv")
    assert_equal 12, output.count
  end

  def test_it_returns_array_of_all_items
    output = InvoiceItemParser.call("./data/invoice_items.csv")
    assert_equal 21687, output.count
  end

end