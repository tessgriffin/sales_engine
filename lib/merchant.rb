class Merchant
  attr_reader :id, :name, :created_at, :updated_at, :repo

  def initialize(id, name, created_at, updated_at, repo)
    @id = id
    @name = name
    @created_at = created_at
    @updated_at = updated_at
    @repo = repo
  end

  def items
    repo.find_items(id)
  end

  def invoices
    repo.find_invoices(id)
  end
end
