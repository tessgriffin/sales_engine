class MerchantRepository
  
  def initialize(merchants)
    @merchants = merchants
  end

  def all
    @merchants
  end

  def random
    @merchants.sample(1).first
  end

  def find_by_id(input)
    @merchants.find do |merchant|
      merchant.id == input
    end
  end

  def find_by_name(input)
    @merchants.find do |merchant|
      merchant.name == input
    end
  end

  def find_by_created_at(input)
    @merchants.find do |merchant|
      merchant.created_at == input
    end
  end

  def find_by_updated_at(input)
    @merchants.find do |merchant|
      merchant.updated_at == input
    end
  end

  def find_all_by_id(input)
    @merchants.find_all do |merchant|
      merchant.id == input
    end
  end

  def find_all_by_name(input)
    @merchants.find_all do |merchant|
      merchant.name == input
    end
  end

  def find_all_by_created_at(input)
    @merchants.find_all do |merchant|
      merchant.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    @merchants.find_all do |merchant|
      merchant.updated_at == input
    end
  end  
end
