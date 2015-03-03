require 'csv'
require_relative 'merchant'
require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'item_parser'
require_relative 'customer_parser'
require_relative 'customer_repository'

class SalesEngine
  def startup
    customer = CustomerParser.new
    @customer_repository = CustomerRepository.new(customer.call)
    # merchant = MerchantParser.new
    # @merchant_repository = MerchantRepository.new(merchant.call)
    # etc.
  end
end
