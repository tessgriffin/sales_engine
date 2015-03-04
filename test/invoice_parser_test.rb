require 'minitest/autorun'
require 'minitest/pride'
require '../lib/invoice_parser'

class InvoiceParserTest < Minitest::Test

  def test_it_exists
    assert InvoiceParser
  end

  def test_it_returns_array_of_one_item
    invoice_parser = InvoiceParser.new
    output = invoice_parser.call("../data/fake_invoices.csv")
    assert output
  end

  def test_it_returns_array_of_2_items
    invoice_parser = InvoiceParser.new
    output = invoice_parser.call("../data/fake_invoices.csv")
    assert_equal 4, output.count
  end

  def test_it_returns_array_of_21687_items
    invoice_parser = InvoiceParser.new
    output = invoice_parser.call("../data/invoices.csv")
    assert_equal 4843, output.count
  end

end
