require_relative 'test_helper'
require_relative '../lib/invoice_parser'

class InvoiceParserTest < Minitest::Test

  def test_it_exists
    assert InvoiceParser
  end

  def test_it_returns_array_of_multiple_items
    output = InvoiceParser.call("./data/fake_invoices.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_all_items
    output = InvoiceParser.call("./data/invoices.csv")
    assert_equal 4843, output.count
  end

end
