require_relative 'customer_parser'
require_relative 'customer_repository'
require_relative 'invoice_items_parser'
require_relative 'invoice_items_repository'
require_relative 'invoice_parser'
require_relative 'invoice_repository'
require_relative 'item_parser'
require_relative 'item_repository'
require_relative 'merchant_parser'
require_relative 'merchant_repository'
require_relative 'transaction_parser'
require_relative 'transaction_repository'


class SalesEngine
  attr_reader :customer_repository, :invoice_items_repository, :invoice_repository, :item_repository, :merchant_repository, :transaction_repository

  def initialize
    @customer_repository = customer_repository
    @invoice_items_repository = invoice_items_repository
    @invoice_repository = invoice_repository
    @item_repository = item_repository
    @merchant_repository = merchant_repository
    @transaction_repository = transaction_repository
  end

  def startup
    customer_data = CustomerParser.call("./data/customers.csv")
    @customer_repository = CustomerRepository.new(customer_data, self)

    invoice_items_data = InvoiceItemsParser.call("./data/invoice_items.csv")
    @invoice_items_repository = InvoiceItemsRepository.new(invoice_items_data, self)

    invoice_data = InvoiceParser.call("./data/invoices.csv")
    @invoice_repository = InvoiceRepository.new(invoice_data, self)

    item_data = ItemParser.call("./data/items.csv")
    @item_repository = ItemRepository.new(item_data, self)

    merchant_data = MerchantParser.call("./data/merchants.csv")
    @merchant_repository = MerchantRepository.new(merchant_data, self)

    transaction_data = TransactionParser.call("./data/transactions.csv")
    @transaction_repository = TransactionRepository.new(transaction_data, self)
  end

  def find_invoices_by_customer_id(id)
    @invoice_repository.find_all_by_customer_id(id)
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
    @invoice_items_repository.find_all_by_item_id(id)
  end

  def find_invoice_items_by_invoice_id(id)
    @invoice_items_repository.find_all_by_invoice_id(id)
  end

  def find_item_by_id(id)
    @item_repository.find_by_id(id)
  end

  def find_items_by_merchant_id(id)
    @item_repository.find_all_by_merchant_id(id)
  end

  def find_items_by_invoice_id(id)
    items = @invoice_items_repository.find_all_by_invoice_id(id)
    items.map do |item|
      @item_repository.find_by_id(item.item_id)
    end
  end

  def find_customer_by_id(id)
    @customer_repository.find_by_id(id)
  end

  def find_merchant_by_invoice_id(id)
    merchant = @invoice_repository.find_by_id(id)
    @merchant_repository.find_by_id(merchant.merchant_id)
  end

  def find_merchant_by_id(id)
    @merchant_repository.find_by_id(id)
  end
end
