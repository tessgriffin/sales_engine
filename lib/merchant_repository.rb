require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants, :sales_engine

  def initialize(parsed_data, sales_engine)
    @merchants = parsed_data.map do |merchant|
      Merchant.new(
        merchant["id"],
        merchant["name"],
        merchant["created_at"],
        merchant["updated_at"],
        self
        )
    end
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def all
    @merchants
  end

  def random
    @merchants.sample
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

  def find_items(id)
    @sales_engine.find_items_by_merchant_id(id)
  end

  def find_invoices(id)
    @sales_engine.find_invoices_by_merchant_id(id)
  end

  def revenue(date)
    merchants_revenue = @merchants.flat_map do |merchant|
      merchant.revenue(date)
    end
    merchants_revenue.reduce(0, :+)
  end

  def most_revenue(n)
   merchants_revenue = @merchants.flat_map do |merchant|
     merchant.revenue
   end
    @merchants.sort_by do |merchant|
      merchants_revenue
    end.reverse.first(n)
  end
  
  def find_favorite_customer(id)
    @sales_engine.find_favorite_customer_for_merchant(id)
  end
end
