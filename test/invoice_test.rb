require_relative 'test_helper'
require_relative "../lib/invoice"

class InvoiceTest < Minitest::Test
  def test_it_exists
    assert Invoice
  end

  def test_it_has_an_id
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal 1, invoice.id
  end

  def test_it_has_a_customer_id
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal 20, invoice.customer_id
  end

  def test_it_has_a_merchant_id
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal 30, invoice.merchant_id
  end

  def test_it_has_a_status
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "status", invoice.status
  end

  def test_it_has_a_created_at
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", invoice.created_at
  end

  def test_it_has_an_updated_at
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", invoice.updated_at
  end

  def test_it_has_an_invoice_repository
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "repository", invoice.repo
  end

  def test_it_can_talk_to_parent_transactions_method
    parent = Minitest::Mock.new
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", parent)
    parent.expect(:find_transactions, [1, 2], [1])
    assert_equal [1, 2], invoice.transactions
    parent.verify
  end

  def test_it_can_talk_to_parent_invoice_items_method
    parent = Minitest::Mock.new
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", parent)
    parent.expect(:find_invoice_items, [1, 2], [1])
    assert_equal [1, 2], invoice.invoice_items
    parent.verify
  end

  def test_it_can_talk_to_parent_items_method
    parent = Minitest::Mock.new
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", parent)
    parent.expect(:find_items, [1, 2], [1])
    assert_equal [1, 2], invoice.items
    parent.verify
  end

  def test_it_can_talk_to_parent_customer_method
    parent = Minitest::Mock.new
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", parent)
    parent.expect(:find_customer, [1, 2], [20])
    assert_equal [1, 2], invoice.customer
    parent.verify
  end

  def test_it_can_talk_to_parent_merchant_method
    parent = Minitest::Mock.new
    invoice = Invoice.new(1, 20, 30, "status", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", parent)
    parent.expect(:find_merchant, [1, 2], [30])
    assert_equal [1, 2], invoice.merchant
    parent.verify
  end

  def test_revenue
    invoice_items = [
      invoice_item_with_revenue(5),
      invoice_item_with_revenue(10),
    ]
    repo = repository_with_invoice_items(invoice_items)
    invoice = Invoice.new(nil, nil, nil, nil, nil, nil, repo)

    assert_equal 15, invoice.revenue
  end

  private

  def repository_with_invoice_items(invoice_items)
    repository = Object.new
    repository.define_singleton_method(:find_invoice_items) do |*|
      invoice_items
    end
    repository
  end

  def invoice_item_with_revenue(revenue)
    invoice_item = Object.new
    invoice_item.define_singleton_method(:revenue) do
      revenue
    end
    invoice_item
  end
end
