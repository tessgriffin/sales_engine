require_relative 'invoice_parser'
require_relative 'invoice'

class InvoiceRepository
  attr_reader :invoices, :sales_engine #for testing

  def initialize(parsed_data, sales_engine)
    @invoices = parsed_data.map do |invoice|
      Invoice.new(invoice["id"], invoice["customer_id"], invoice["merchant_id"], invoice["status"], invoice["created_at"], invoice["updated_at"], self)
    end
    @sales_engine = sales_engine
  end

  def all
    @invoices
  end

  def random
    @invoices.sample(1).first
  end

  def find_by_id(input)
    @invoices.find do |invoice|
      invoice.id == input
    end
  end

  def find_by_customer_id(input)
    @invoices.find do |invoice|
      invoice.customer_id == input
    end
  end

  def find_by_merchant_id(input)
    @invoices.find do |invoice|
      invoice.merchant_id == input
    end
  end

  def find_by_status(input)
    @invoices.find do |invoice|
      invoice.status == input
    end
  end

  def find_by_created_at(input)
    @invoices.find do |invoice|
      invoice.created_at == input
    end
  end

  def find_by_updated_at(input)
    @invoices.find do |invoice|
      invoice.updated_at == input
    end
  end

  def find_all_by_id(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |invoice|
      invoice.id == input
    end
  end

  def find_all_by_customer_id(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |invoice|
      invoice.customer_id == input
    end
  end

  def find_all_by_merchant_id(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |invoice|
      invoice.merchant_id == input
    end
  end

  def find_all_by_status(input)
    @invoices.find_all do |invoice|
      invoice.status == input
    end
  end

  def find_all_by_created_at(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |invoice|
      invoice.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |invoice|
      invoice.updated_at == input
    end
  end

  def find_transactions(id)
    @sales_engine.find_transactions_by_invoice_id(id)
  end

  def find_invoice_items(id)
    @sales_engine.find_invoice_items_by_invoice_id(id)
  end

  def find_items(id)
    @sales_engine.find_items_by_invoice_id(id)
  end

  def find_customer(id)
    @sales_engine.find_customer_by_invoice_id(id)
  end

  def find_merchant(id)
    @sales_engine.find_merchant_by_invoice_id(id)
  end
end
