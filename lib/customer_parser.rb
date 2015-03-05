require 'csv'
require_relative 'customer'
# require_relative 'customer_repository'

class CustomerParser

  def call(file)
    customers = CSV.open(file, {:headers => true} )
    customer_array = []

    customers.each do |customer|
      customer_array << Customer.new(customer["id"], customer["first_name"], customer["last_name"], customer["created_at"], customer["updated_at"], "customer_repository")
    end

    customer_array
  end

end
