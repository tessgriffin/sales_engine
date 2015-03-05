class CustomerRepository
  def initialize(customers, sales_engine)
    @customers = customers
    @sales_engine = sales_engine
  end

  def all
    @customers
  end

  def random
    @customers.sample(1).first
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
    #test if doesn't find it then it returns nil
    #output is array so you can test based on count
    @customers.find_all do |customer|
      customer.id == input
    end
  end

  def find_all_by_first_name(input)
    #test if doesn't find it then it returns nil
    @customers.find_all do |customer|
      customer.first_name == input
    end
  end

  def find_all_by_last_name(input)
    #test if doesn't find it then it returns nil
    @customers.find_all do |customer|
      customer.last_name == input
    end
  end

  def find_all_by_created_at(input)
    #test if doesn't find it then it returns nil
    @customers.find_all do |customer|
      customer.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    #test if doesn't find it then it returns nil
    @customers.find_all do |customer|
      customer.updated_at == input
    end
  end
end
