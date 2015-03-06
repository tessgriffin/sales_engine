require_relative 'test_helper'
require_relative "../lib/invoice"

class InvoiceTest < Minitest::Test
  def test_it_exists
    assert Invoice
  end

  def test_it_has_an_id
    invoice = Invoice.new("1", "customer_id", "merchant_id", "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "1", invoice.id
  end

  def test_it_has_a_customer_id
    invoice = Invoice.new("1", "customer_id", "merchant_id", "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "customer_id", invoice.customer_id
  end

  def test_it_has_a_merchant_id
    invoice = Invoice.new("1", "customer_id", "merchant_id", "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "merchant_id", invoice.merchant_id
  end

  def test_it_has_a_status
    invoice = Invoice.new("1", "customer_id", "merchant_id", "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "status", invoice.status
  end

  def test_it_has_a_created_at
    invoice = Invoice.new("1", "customer_id", "merchant_id", "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", invoice.created_at
  end

  def test_it_has_an_updated_at
    invoice = Invoice.new("1", "customer_id", "merchant_id", "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", invoice.updated_at
  end

  def test_it_has_an_invoice_repository
    invoice = Invoice.new("1", "customer_id", "merchant_id", "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "repository", invoice.invoice_repository
  end
end
