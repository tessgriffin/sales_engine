class Customer
  attr_reader(
    :id,
    :first_name,
    :last_name,
    :created_at,
    :updated_at,
    :repo
  )

  def initialize(
    id,
    first_name,
    last_name,
    created_at,
    updated_at,
    repo
  )
    @id = id.to_i
    @first_name = first_name
    @last_name = last_name
    @created_at = created_at
    @updated_at = updated_at
    @repo = repo
  end

  def invoices
    @repo.find_invoices(id)
  end

  def transactions
    @repo.find_transactions_for_customer(id)
  end
end
