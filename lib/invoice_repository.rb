class InvoiceRepository
  def initialize(invoices, sales_engine)
    @invoices = invoices
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
end
