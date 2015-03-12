require 'bigdecimal'
require 'bigdecimal/util'
require_relative 'item'

class ItemRepository
  attr_reader :items, :sales_engine

  def initialize(parsed_data, sales_engine)
    @items = parsed_data.map do |item|
      Item.new(
        item["id"],
        item["name"],
        item["description"],
        item["unit_price"],
        item["merchant_id"],
        item["created_at"],
        item["updated_at"],
        self
      )
    end
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

  def all
    @items
  end

  def random
    @items.sample
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

  def find_invoice_items(id)
    sales_engine.find_invoice_items_by_item_id(id)
  end

  def find_merchant(merchant_id)
    sales_engine.find_merchant_by_id(merchant_id)
  end

  def revenue_for_items
    @items.map(&:revenue).reduce(0, :+)
  end

  def most_revenue(x)
    @items.sort_by(&:revenue).reverse.first(x)
  end

  def find_successful_invoice_items(id)
    find_invoice_items(id).select do |invoice_item|
      sales_engine.successful_transactions_from_invoice_id(invoice_item.invoice_id)
    end
  end

  def find_items_sold(id)
    find_successful_invoice_items(id).inject(0) do |sum, invoice_item|
      sum + invoice_item.quantity
    end
  end

  def most_items(x)
    @items.sort_by { |item| item.number_sold }.reverse.first(x)
  end
end
