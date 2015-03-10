require_relative 'invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items, :sales_engine

  def initialize(parsed_data, sales_engine)
    @invoice_items = parsed_data.map do |data|
      InvoiceItem.new(
        data["id"],
        data["item_id"],
        data["invoice_id"],
        data["quantity"],
        data["unit_price"],
        data["created_at"],
        data["updated_at"],
        self,
      )
    end
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def all
    @invoice_items
  end

  def random
    @invoice_items.sample
  end

  def find_by_id(input)
    @invoice_items.find do |invoice_item|
      invoice_item.id == input
    end
  end

  def find_by_item_id(input)
    @invoice_items.find do |invoice_item|
      invoice_item.item_id == input
    end
  end

  def find_by_invoice_id(input)
    @invoice_items.find do |invoice_item|
      invoice_item.invoice_id == input
    end
  end

  def find_by_quantity(input)
    @invoice_items.find do |invoice_item|
      invoice_item.quantity == input
    end
  end

  def find_by_unit_price(input)
    @invoice_items.find do |invoice_item|
      invoice_item.unit_price == input
    end
  end

  def find_by_created_at(input)
    @invoice_items.find do |invoice_item|
      invoice_item.created_at == input
    end
  end

  def find_by_updated_at(input)
    @invoice_items.find do |invoice_item|
      invoice_item.updated_at == input
    end
  end

  def find_all_by_id(input)
    @invoice_items.find_all do |invoice_item|
      invoice_item.id == input
    end
  end

  def find_all_by_item_id(input)
    @invoice_items.find_all do |invoice_item|
      invoice_item.item_id == input
    end
  end

  def find_all_by_invoice_id(input)
    @invoice_items.find_all do |invoice_item|
      invoice_item.invoice_id == input
    end
  end

  def find_all_by_quantity(input)
    @invoice_items.find_all do |invoice_item|
      invoice_item.quantity == input
    end
  end

  def find_all_by_unit_price(input)
    @invoice_items.find_all do |invoice_item|
      invoice_item.unit_price == input
    end
  end

  def find_all_by_created_at(input)
    @invoice_items.find_all do |invoice_item|
      invoice_item.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    @invoice_items.find_all do |invoice_item|
      invoice_item.updated_at == input
    end
  end

  def find_invoice(invoice_id)
    sales_engine.find_invoice_by_id(invoice_id)
  end

  def find_item(item_id)
    sales_engine.find_item_by_id(item_id)
  end
end
