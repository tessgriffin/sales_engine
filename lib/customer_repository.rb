class CustomerRepository
  def initialize(customers)
    @customers = customers
  end

  def all
    @customers
  end

  def random
    @customers.sample(1).first
  end
end
