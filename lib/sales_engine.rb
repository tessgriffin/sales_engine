require_relative 'customer_parser'
require_relative 'customer_repository'
require_relative 'invoice_items_repository'
require_relative 'invoice_repository'
require_relative 'item_parser'
require_relative 'item_repository'
require_relative 'merchant_parser'
require_relative 'merchant_repository'
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

    #@invoice_items_repository = InvoiceItemsRepository.new(invoice_items.call("../data/invoice_items.csv"), self)

    #@invoice_repository = InvoiceRepository.new(invoices.call("./data/invoices.csv"), self)

    #item_data = ItemParser.call("./data/items.csv")
    #@item_repository = ItemRepository.new(item_data, self)

    merchant_data = MerchantParser.call("./data/merchants.csv")
    @merchant_repository = MerchantRepository.new(merchant_data, self)

    #@transaction_repository = TransactionRepository.new(transactions.call("./data/transactions.csv"), self)

  end

  def find_items_by_merchant_id(id)
    @item_repository.find_all_by_id(id)
  end
end
