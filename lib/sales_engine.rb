require_relative 'parser'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'merchant_repository'
require_relative 'transaction_repository'


class SalesEngine
  attr_reader :customer_repository, :invoice_item_repository, :invoice_repository, :item_repository, :merchant_repository, :transaction_repository, :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def startup
    initialize_merchant_repository
    initialize_customer_repository
    initialize_invoice_item_repository
    initialize_invoice_repository
    initialize_item_repository
    initialize_transaction_repository
  end

  def initialize_merchant_repository
    data = Parser.call("#{@filepath}/merchants.csv")
    @merchant_repository = MerchantRepository.new(data, self)
  end

  def initialize_customer_repository
    customer_data = Parser.call("#{@filepath}/customers.csv")
    @customer_repository = CustomerRepository.new(customer_data, self)
  end

  def initialize_invoice_item_repository
    invoice_items_data = Parser.call("#{@filepath}/invoice_items.csv")
    @invoice_item_repository = InvoiceItemRepository.new(invoice_items_data, self)
  end

  def initialize_invoice_repository
    invoice_data = Parser.call("#{@filepath}/invoices.csv")
    @invoice_repository = InvoiceRepository.new(invoice_data, self)
  end

  def initialize_item_repository
    item_data = Parser.call("#{@filepath}/items.csv")
    @item_repository = ItemRepository.new(item_data, self)
  end

  def initialize_transaction_repository
    transaction_data = Parser.call("#{@filepath}/transactions.csv")
    @transaction_repository = TransactionRepository.new(transaction_data, self)
  end

  def find_invoices_by_customer_id(id)
    @invoice_repository.find_all_by_customer_id(id)
  end

  def find_transactions_for_customer(id)
    invoices = find_invoices_by_customer_id(id)
    invoices.flat_map do |invoice|
      find_transactions_by_invoice_id(invoice.id)
    end
  end

  def find_invoices_for_successful_transactions(transactions)
    transactions.flat_map do |transaction|
      if transaction.result == "success"
        find_invoice_by_id(transaction.invoice_id)
      end
    end
  end

  def find_favorite_merchant_for_customer(id)
    transactions = find_transactions_for_customer(id).flatten
    invoices = find_invoices_for_successful_transactions(transactions)
    merchants = invoices.flat_map do |invoice|
      find_merchant_by_id(invoice.merchant_id)
    end
    merchants.first
  end

  def find_invoice_by_transaction_id(id)
    transaction = @transaction_repository.find_by_id(id)
    invoice_id = transaction.invoice_id
    @invoice_repository.find_by_id(invoice_id)
  end

  def find_invoice_by_id(id)
    @invoice_repository.find_by_id(id)
  end

  def find_invoices_by_merchant_id(id)
    @invoice_repository.find_all_by_merchant_id(id)
  end

  def find_transactions_by_invoice_id(id)
    @transaction_repository.find_all_by_invoice_id(id)
  end

  def find_invoice_items_by_item_id(id)
    @invoice_item_repository.find_all_by_item_id(id)
  end

  def find_invoice_items_by_invoice_id(id)
    @invoice_item_repository.find_all_by_invoice_id(id)
  end

  def find_item_by_id(id)
    @item_repository.find_by_id(id)
  end

  def find_items_by_merchant_id(id)
    @item_repository.find_all_by_merchant_id(id)
  end

  def find_items_by_invoice_id(id)
    items = @invoice_item_repository.find_all_by_invoice_id(id)
    items.map do |item|
      @item_repository.find_by_id(item.item_id)
    end
  end

  def find_customer_by_id(id)
    @customer_repository.find_by_id(id)
  end

  def find_merchant_by_id(id)
    @merchant_repository.find_by_id(id)
  end
end
