require 'bigdecimal'
require 'bigdecimal/util'
class Merchant
  attr_reader :id, :name, :created_at, :updated_at, :repo

  def initialize(id, name, created_at, updated_at, repo)
    @id = id.to_i
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

  def revenue
    output = invoices.map(&:revenue).reduce(0, :+)
    (BigDecimal.new(output) / 100).to_digits
  end
end
