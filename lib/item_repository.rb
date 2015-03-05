class ItemRepository
  def initialize(items)
    @items = items
  end

  def all
    @items
  end

  def random
    @items.sample(1).first
  end

  def find_by_id(input)
    @items.find do |item|
      item.id == input
    end
  end

  def find_by_name(input)
    @items.find do |item|
      item.name == input
    end
  end

  def find_by_description(input)
    @items.find do |item|
      item.description == input
    end
  end

  def find_by_unit_price(input)
    @items.find do |item|
      item.unit_price == input
    end
  end  

  def find_by_merchant_id(input)
    @items.find do |item|
      item.merchant_id == input
    end
  end

  def find_by_created_at(input)
    @items.find do |item|
      item.created_at == input
    end
  end

  def find_by_updated_at(input)
    @items.find do |item|
      item.updated_at == input
    end
  end  

  def find_all_by_id(input)
    @items.find_all do |item|
      item.id == input
    end
  end

  def find_all_by_name(input)
    @items.find_all do |item|
      item.name == input
    end
  end

  def find_all_by_description(input)
    @items.find_all do |item|
      item.description == input
    end
  end

  def find_all_by_unit_price(input)
    @items.find_all do |item|
      item.unit_price == input
    end
  end  

  def find_all_by_merchant_id(input)
    @items.find_all do |item|
      item.merchant_id == input
    end
  end

  def find_all_by_created_at(input)
    @items.find_all do |item|
      item.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    @items.find_all do |item|
      item.updated_at == input
    end
  end   
end
