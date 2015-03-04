require 'csv'
require_relative 'customer'

class CustomerParser

  def call(file)
    customers = CSV.open(file, {:headers => true} )
    customer_array = []

    customers.each do |customer|
      customer_array << Customer.new(customer["id"], customer["first_name"], customer["last_name"], customer["created_at"], customer["updated_at"])
    end

    customer_array
  end

end
