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
    @customers.find do |x|
      x.first_name == input
    end
  end

  def find_by_last_name(input)
    @customers.find do |x|
      x.last_name == input
    end
  end

  def find_by_created_at(input)
    @customers.find do |x|
      x.created_at == input
    end
  end

  def find_by_updated_at(input)
    @customers.find do |x|
      x.updated_at == input
    end
  end

  def find_all_by_id(input)
    #test if doesn't find it then it returns nil
    #output is array so you can test based on count
    @customers.find_all do |x|
      x.id == input
    end
  end

  def find_all_by_first_name(input)
    #test if doesn't find it then it returns nil
    @customers.find_all do |x|
      x.first_name == input
    end
  end

  def find_all_by_last_name(input)
    #test if doesn't find it then it returns nil
    @customers.find_all do |x|
      x.last_name == input
    end
  end

  def find_all_by_created_at(input)
    #test if doesn't find it then it returns nil
    @customers.find_all do |x|
      x.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    #test if doesn't find it then it returns nil
    @customers.find_all do |x|
      x.updated_at == input
    end
  end
end
