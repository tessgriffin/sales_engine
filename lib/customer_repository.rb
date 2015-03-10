require_relative 'customer_parser'
require_relative 'customer'

class CustomerRepository
  attr_reader :customers, :sales_engine

  def initialize(parsed_data, sales_engine)
    @customers = parsed_data.map do |customer|
      Customer.new(
        customer["id"], 
        customer["first_name"],
        customer["last_name"], 
        customer["created_at"],
        customer["updated_at"], 
        self
      )
    end
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@customers.size} rows>"
  end

  def all
    @customers
  end

  def random
    @customers.sample
  end

  def find_by_id(input)
    @customers.find do |customer|
      customer.id == input
    end
  end

  def find_by_first_name(input)
    @customers.find do |customer|
      customer.first_name == input
    end
  end

  def find_by_last_name(input)
    @customers.find do |customer|
      customer.last_name == input
    end
  end

  def find_by_created_at(input)
    @customers.find do |customer|
      customer.created_at == input
    end
  end

  def find_by_updated_at(input)
    @customers.find do |customer|
      customer.updated_at == input
    end
  end

  def find_all_by_id(input)
    @customers.find_all do |customer|
      customer.id == input
    end
  end

  def find_all_by_first_name(input)
    @customers.find_all do |customer|
      customer.first_name == input
    end
  end

  def find_all_by_last_name(input)
    @customers.find_all do |customer|
      customer.last_name == input
    end
  end

  def find_all_by_created_at(input)
    @customers.find_all do |customer|
      customer.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    @customers.find_all do |customer|
      customer.updated_at == input
    end
  end

  def find_invoices(id)
    @sales_engine.find_invoices_by_customer_id(id)
  end

  def find_transactions_for_customer(id)
    @sales_engine.find_transactions_for_customer(id)
  end

  def find_favorite_merchant(id)
    @sales_engine.find_favorite_merchant_for_customer(id)
  end
end
