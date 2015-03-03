require 'csv'
require_relative 'invoice'
require_relative 'invoice_repository'

class InvoiceParser
  def call
    invoices = CSV.open("../data/customers.csv", {:headers => true} )
    invoice_array = []

    invoices.each do |invoice|
      invoice_array << Invoice.new(invoice["id"], invoice["customer_id"], invoice["merchant_id"], invoice["status"], invoice["created_at"], invoice["updated_at"])
    end

    invoice_array
  end
end
