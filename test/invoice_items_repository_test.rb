require 'minitest/autorun'
require 'minitest/pride'
require "../lib/invoice_items_repository"

class InvoiceItemsRepositoryTest < Minitest::Test
  def test_all
    array_fake_invoice_itemss = Object.new
    invoice_items_repository = InvoiceItemsRepository.new(array_fake_invoice_itemss)
    assert_equal array_fake_invoice_itemss, invoice_items_repository.all
  end

  def test_random_empty
    array_fake_invoice_itemss = []
    invoice_items_repository = InvoiceItemsRepository.new(array_fake_invoice_itemss)
    assert_equal nil, invoice_items_repository.random
  end

  def test_random_one
    fake_invoice_items = Object.new
    array_fake_invoice_itemss = [fake_invoice_items]
    invoice_items_repository = InvoiceItemsRepository.new(array_fake_invoice_itemss)
    assert_equal fake_invoice_items, invoice_items_repository.random
  end
end
