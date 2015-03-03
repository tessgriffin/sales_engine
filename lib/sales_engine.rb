require 'csv'
require_relative 'merchant'
require_relative 'merchant_repository'

class SalesEngine
  def startup
    customer = CustomerParser.new
    @customer_repository = CustomerRepository.new(customer.call)
  end
end
