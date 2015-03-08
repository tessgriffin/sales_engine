require_relative 'test_helper'
require_relative '../lib/invoice_item'

class InvoiceItemsTest < Minitest::Test
  def test_it_exists
    assert InvoiceItem
  end

  def test_it_has_an_id
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "1", invoice_item.id
  end

  def test_it_has_an_item_id
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "Item ID", invoice_item.item_id
  end

  def test_it_has_an_invoice_id
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "Invoice ID", invoice_item.invoice_id
  end

  def test_it_has_a_quantitiy
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "1", invoice_item.quantity
  end

  def test_it_has_a_unit_price
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "19", invoice_item.unit_price
  end

  def test_it_has_a_created_at
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "2012-03-27 14:53:59 UTC", invoice_item.created_at
  end

  def test_it_has_an_updated_at
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "2012-03-27 14:53:59 UTC", invoice_item.updated_at
  end

  def test_it_knows_parent
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "repo", invoice_item.repo
  end  

  def test_it_finds_its_invoice
    parent = Minitest::Mock.new
    invoice_item = InvoiceItem.new("1", "Item ID", "Invoice ID", "1", "19", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", parent)
    parent.expect(:find_invoice, [2], [invoice_item.invoice_id])
    assert_equal [2], invoice_item.invoice
    parent.verify
  end
end
