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
end
