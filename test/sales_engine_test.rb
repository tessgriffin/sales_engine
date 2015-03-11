require_relative 'test_helper'
require_relative "../lib/sales_engine"

class SalesEngineTest < Minitest::Test
  def setup
    @engine = SalesEngine.new("./data/")
    @engine.startup
  end

  def test_it_exists
    assert SalesEngine
  end

  def test_it_has_a_customer_repo_when_started_up
    assert @engine.customer_repository
  end

  def test_it_has_an_invoice_items_repo_when_started_up
    assert @engine.invoice_item_repository
  end

  def test_it_has_an_invoice_repo_when_started_up
    assert @engine.invoice_repository
  end

  def test_it_has_an_item_repo_when_started_up
    assert @engine.item_repository
  end

  def test_it_has_a_merchant_repo_when_started_up
    assert @engine.merchant_repository
  end

  def test_it_has_a_transaction_repo_when_started_up
    assert @engine.transaction_repository
  end

  def test_it_can_find_invoices_by_customer_id
    invoices = @engine.find_invoices_by_customer_id(3)
    assert_equal 4, invoices.count
  end

  def test_it_can_find_transactions_for_a_customer
    transactions = @engine.find_transactions_for_customer(1)
    assert_equal 7, transactions.count
  end

  def test_it_can_find_invoices_for_successful_transactions
    transactions = @engine.find_transactions_for_customer(3)
    assert_equal 7, transactions.count
    invoices = @engine.find_invoices_for_successful_transactions(transactions)
    assert_equal 3, invoices.count
  end

  def test_it_can_find_merchant_by_invoice
    transactions = @engine.find_transactions_for_customer(3)
    invoices = @engine.find_invoices_for_successful_transactions(transactions)
    merchants = @engine.find_merchant_by_invoice(invoices)
    assert_equal 86, merchants.first.id
  end

  def test_it_can_find_a_favorite_merchant
    merchant = @engine.find_favorite_merchant_for_customer(1)
    assert_equal "Balistreri, Schaefer and Kshlerin", merchant.name
  end

  def test_it_can_find_transactions_for_merchant
    transactions = @engine.find_transactions_for_merchant(8)
    assert_equal 42, transactions.count
  end

  def test_it_can_find_customer_by_invoice
    transactions = @engine.find_transactions_for_merchant(8)
    invoices = @engine.find_invoices_for_successful_transactions(transactions)
    customers = @engine.find_customer_by_invoice(invoices)
    assert_equal 35, customers.count
  end

  def test_it_can_find_a_favorite_customer
    customer = @engine.find_favorite_customer_for_merchant(8)
    assert_equal "Toy", customer.last_name
  end

  def test_it_can_find_transactions_by_invoices
    invoices = @engine.find_invoices_by_merchant_id(8)
    transactions = @engine.find_transactions_by_invoices(invoices)
    assert_equal 42, transactions.count
  end

  def test_it_can_find_failed_transactions
    invoices = @engine.find_invoices_by_merchant_id(8)
    transactions = @engine.find_transactions_by_invoices(invoices)
    failed_transactions = @engine.find_failed_transactions(transactions)
    assert_equal 7, failed_transactions.count
  end

  def test_it_can_find_invoice_ids_by_transaction
    invoices = @engine.find_invoices_by_merchant_id(8)
    transactions = @engine.find_transactions_by_invoices(invoices)
    invoice_ids = @engine.find_invoice_ids_by_transaction(transactions)
    assert_equal invoices.first.id, invoice_ids.first
  end

  def test_id_counter_hash
    invoice_id_hash = @engine.id_counter_hash(8)
    assert_equal 3, invoice_id_hash[12]
  end

  def test_failed_id_counter_hash
    failed_invoice_id_hash = @engine.failed_id_counter_hash(8)
    assert_equal 2, failed_invoice_id_hash[12]
  end

  def test_it_can_find_pending_invoices
    pending_invoices = @engine.find_pending_invoices(8)
    assert_equal 1, pending_invoices.count
  end

  def test_find_customers_with_pending_invoices_for_merchant
    customers = @engine.find_customers_with_pending_invoices_for_merchant(8)
    assert_equal "Langworth", customers.first.last_name
  end

  def test_it_can_find_invoices_by_transaction_id
    invoice = @engine.find_invoice_by_transaction_id(3)
    assert_equal 33, invoice.merchant_id
  end

  def test_it_can_find_invoice_by_id
    invoice = @engine.find_invoice_by_id(1)
    assert_equal 26, invoice.merchant_id
  end

  def test_it_can_find_invoices_by_merchant_id
    invoices = @engine.find_invoices_by_merchant_id(26)
    assert_equal 48, invoices.count
  end

  def test_it_can_find_transactions_by_invoice_id
    transactions = @engine.find_transactions_by_invoice_id(12)
    assert_equal 3, transactions.count
  end

  def test_it_can_find_invoice_items_by_item_id
    invoice_items = @engine.find_invoice_items_by_item_id(539)
    assert_equal 7, invoice_items.count
  end

  def test_it_can_find_invoice_items_by_invoice_id
    invoice_items = @engine.find_invoice_items_by_invoice_id(1)
    assert_equal 8, invoice_items.count
  end

  def test_it_can_find_items_by_id
    item = @engine.find_item_by_id(2)
    assert_equal "Item Autem Minima", item.name
  end

  def test_it_can_find_items_by_merchant_id
    items = @engine.find_items_by_merchant_id(2)
    assert_equal 38, items.count
  end

  def test_it_can_find_items_by_invoice_id
    item = @engine.find_items_by_invoice_id(4)
    assert_equal 2, item.count
  end

  def test_it_can_find_customer_by_id
    customer = @engine.find_customer_by_id(9)
    assert_equal "Fadel", customer.last_name
  end

  def test_it_can_find_merchant_by_id
    merchant = @engine.find_merchant_by_id(1)
    assert_equal "Schroeder-Jerde", merchant.name
  end
end
