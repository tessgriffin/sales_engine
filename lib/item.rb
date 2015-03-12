require 'bigdecimal'
require 'bigdecimal/util'
class Item

  attr_reader :id,
    :name,
    :description,
    :unit_price,
    :merchant_id,
    :created_at,
    :updated_at,
    :repo

  def initialize(
      id,
      name,
      description,
      unit_price,
      merchant_id,
      created_at,
      updated_at,
      repo
    )

    @id = id.to_i
    @name = name
    @description = description
    @unit_price = (unit_price.to_d)/100
    @merchant_id = merchant_id.to_i
    @created_at = created_at
    @updated_at = updated_at
    @repo = repo
  end

  def [](key)
    __send__(key) if respond_to? key
  end

  def invoice_items
    repo.find_invoice_items(id)
  end

  def successful_invoice_items
    invoice_items.select do |invoice_item|
      invoice_item.successful_invoice
    end
  end

  def merchant
    repo.find_merchant(merchant_id)
  end

  def revenue
    invoice_items.map(&:revenue).reduce(0, :+)
  end

  def best_day
    grouped_by_date_quantity.max_by { |date, quantity| quantity }.first
  end

  def grouped_by_date_quantity
    successful_invoice_items.reduce(Hash.new(0)) do |hash, invoice_item|
      date = invoice_item.invoice.created_at
      date = Date.parse(date)
      hash[date] += invoice_item.quantity
      hash
    end
  end

  def number_sold
    repo.find_items_sold(id)
  end
end