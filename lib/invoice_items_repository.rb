class InvoiceItemsRepository
  def initialize(invoice_items)
    @invoice_items = invoice_items
  end

  def all
    @invoice_items
  end

  def random
    @invoice_items.sample(1).first
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
end