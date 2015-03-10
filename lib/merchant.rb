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

  def successful_invoices
    invoices.select do |invoice|
      invoice.transactions.any? do |transaction|
        transaction.result == "success"
      end
    end
  end

  def successful_invoices_by_date(date)
    return successful_invoices if date == nil
    successful_invoices.select do |invoice|
      Date.parse(invoice.created_at) == date
    end
  end

  def revenue(date=nil)
    output = successful_invoices_by_date(date).map(&:revenue).reduce(0, :+)
    (BigDecimal.new(output) / 100)
  end

  def favorite_customer
    @repo.find_favorite_customer(id)
  end
end
