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

  def find_by_id(input)
    @customers.find do |x|
      x.id == input
    end
  end

  def find_by_first_name(input)

  end

  def find_by_last_name(input)

  end

  def find_by_created_at(input)

  end

  def find_by_updated_at(input)

  end

  def find_all_by_id(input)

  end

  def find_all_by_first_name(input)

  end

  def find_all_by_last_name(input)

  end

  def find_all_by_created_at(input)

  end

  def find_all_by_updated_at(input)

  end

end
