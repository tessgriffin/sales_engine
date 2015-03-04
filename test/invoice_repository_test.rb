require 'minitest/autorun'
require 'minitest/pride'
require "../lib/invoice_repository"

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
end
