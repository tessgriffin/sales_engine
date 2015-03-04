require 'minitest/autorun'
require 'minitest/pride'
require "../lib/invoice_repository"
require "../lib/invoice_parser"

class InvoiceRepositoryTest < Minitest::Test
  def test_all
    array_fake_invoices = Object.new
    invoice_repository = InvoiceRepository.new(array_fake_invoices)
    assert_equal array_fake_invoices, invoice_repository.all
  end

  def test_random_empty
    array_fake_invoices = []
    invoice_repository = InvoiceRepository.new(array_fake_invoices)
    assert_equal nil, invoice_repository.random
  end

  def test_random_one
    fake_invoice = Object.new
    array_fake_invoices = [fake_invoice]
    invoice_repository = InvoiceRepository.new(array_fake_invoices)
    assert_equal fake_invoice, invoice_repository.random
  end

  def test_find_by_id
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal "shipped", invoice_repository.find_by_id("5").status
  end

  def test_find_by_customer_id
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal "26", invoice_repository.find_by_customer_id("1").merchant_id
  end

  def test_find_by_merchant_id
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal "3", invoice_repository.find_by_merchant_id("86").customer_id
  end

  def test_find_by_status
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal "1", invoice_repository.find_by_status("shipped").id
  end

  def test_find_by_created_at
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal "26", invoice_repository.find_by_created_at("2012-03-25 09:54:09 UTC").merchant_id
  end

  def test_find_by_updated_at
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal "75", invoice_repository.find_by_updated_at("2012-03-12 05:54:09 UTC").merchant_id
  end

  def test_find_all_by_id
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal 1, invoice_repository.find_all_by_id("16").count
  end

  def test_find_all_by_customer_id
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal 8, invoice_repository.find_all_by_customer_id("1").count
  end

  def test_find_all_by_merchant_id
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal 48, invoice_repository.find_all_by_merchant_id("26").count
  end

  def test_find_all_by_status
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal 4843, invoice_repository.find_all_by_status("shipped").count
  end

  def test_find_all_by_created_at
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal 1, invoice_repository.find_all_by_created_at("2012-03-25 09:54:09 UTC").count
  end

  def test_find_all_by_updated_at
    parser = InvoiceParser.new
    invoice_array = parser.call("../data/invoices.csv")
    invoice_repository = InvoiceRepository.new(invoice_array)
    assert_equal 1, invoice_repository.find_all_by_updated_at("2012-03-25 09:54:09 UTC").count
  end
end
