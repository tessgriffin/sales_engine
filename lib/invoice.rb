class Invoice
  attr_reader(
    :id,
    :customer_id,
    :merchant_id,
    :status,
    :created_at,
    :updated_at,
    :repo
  )

  def initialize(
    id,
    customer_id,
    merchant_id,
    status,
    created_at,
    updated_at,
    repo
  )
    @id = id.to_i
    @customer_id = customer_id.to_i
    @merchant_id = merchant_id.to_i
    @status = status
    @created_at = created_at
    @updated_at = updated_at
    @repo = repo
  end

  def transactions
    repo.find_transactions(id)
  end

  def successful_transactions
    transactions.select do |transaction|
      transaction.result == "success"
    end
  end

  def invoice_items
    repo.find_invoice_items(id)
  end

  def quantity_invoice_items_sold
    invoice_items.map(&:quantity).reduce(0, :+)
  end

  def items
    repo.find_items(id)
  end

  def customer
    repo.find_customer(customer_id)
  end

  def merchant
    repo.find_merchant(merchant_id)
  end

  def revenue
    invoice_items.map(&:revenue).reduce(0, :+)
  end

  def charge(credit_card_number, credit_card_expiration_date, result)
    repo.move_to_transactions(credit_card_number, credit_card_expiration_date, result)
  end
end
