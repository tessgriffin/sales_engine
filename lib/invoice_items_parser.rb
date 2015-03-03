require 'csv'
require_relative 'invoice_item'

class InvoiceItemsParser

  attr_reader :invoice_items_array

  def initialize
    @invoice_items_array = []
  end


  def parse_invoice_items(file)
    invoice_items = CSV.open("#{file}", {:headers => true} )

    invoice_items.each do |item|
      @invoice_items_array << InvoiceItem.new(item["id"], item["item_id"], item["invoice_id"], item["quantity"], item["unit_price"], item["created_at"], item["updated_at"])
    end
    @invoice_items_array
  end

end