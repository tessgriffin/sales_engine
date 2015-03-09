class Item

  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :repo

  def initialize(id, name, description, unit_price, merchant_id, created_at, updated_at, repo)
    @id = id.to_i
    @name = name
    @description = description
    @unit_price = unit_price.to_i
    @merchant_id = merchant_id.to_i
    @created_at = created_at
    @updated_at = updated_at
    @repo = repo
  end
  
  def invoice_items
    repo.find_invoice_items(id)
  end

  def merchant
    repo.find_merchant(merchant_id)
  end
end
