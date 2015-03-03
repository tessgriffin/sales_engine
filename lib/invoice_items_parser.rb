require 'csv'
require_relative 'invoice_item'

class InvoiceItemsParser

  def call(file)
    invoice_items = CSV.open("#{file}", {:headers => true} )
    invoice_items_array = []

    invoice_items.each do |item|
      invoice_items_array << InvoiceItem.new(item["id"], item["item_id"], item["invoice_id"], item["quantity"], item["unit_price"], item["created_at"], item["updated_at"])
    end
    invoice_items_array
  end

end