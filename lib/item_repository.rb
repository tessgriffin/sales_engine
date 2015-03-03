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
end
