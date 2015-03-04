require 'csv'
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

  def startup
    customers = CustomerParser.new
    @customer_repository = CustomerRepository.new(customers.call)

    invoice_items = InvoiceItemsParser.new
    @invoice_items_repository = InvoiceItemsRepository.new(invoice_items.call)

    invoices = InvoiceParser.new
    @invoice_repository = InvoiceRepository.new(invoices.call)

    items = ItemParser.new
    @item_repository = ItemRepository.new(items.call)

    merchants = MerchantParser.new
    @merchant_repository = MerchantRepository.new(merchants.call)

    transactions = TransactionParser.new
    @transaction_repository = TransactionRepository.new(transactions.call)

  end
end
