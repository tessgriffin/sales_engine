class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at, :repo

  def initialize(id, customer_id, merchant_id, status, created_at, updated_at, repo)
    @id = id
    @customer_id = customer_id
    @merchant_id = merchant_id
    @status = status
    @created_at = created_at
    @updated_at = updated_at
    @repo = repo
  end

  def transactions
    repo.find_transactions(id)
  end

  def invoice_items
    repo.find_invoice_items(id)
  end

  def items
    repo.find_items(id)
  end

  def customer
    repo.find_customer(id)
  end

  def merchant
    repo.find_merchant(id)
  end

  def revenue
    invoice_items.map(&:revenue).reduce(0, :+)
  end
end
