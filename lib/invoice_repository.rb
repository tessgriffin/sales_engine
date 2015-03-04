class InvoiceRepository
  def initialize(invoices)
    @invoices = invoices
  end

  def all
    @invoices
  end

  def random
    @invoices.sample(1).first
  end

  def find_by_id(input)
    @invoices.find do |x|
      x.id == input
    end
  end

  def find_by_customer_id(input)
    @invoices.find do |x|
      x.customer_id == input
    end
  end

  def find_by_merchant_id(input)
    @invoices.find do |x|
      x.merchant_id == input
    end
  end

  def find_by_status(input)
    @invoices.find do |x|
      x.status == input
    end
  end

  def find_by_created_at(input)
    @invoices.find do |x|
      x.created_at == input
    end
  end

  def find_by_updated_at(input)
    @invoices.find do |x|
      x.updated_at == input
    end
  end

  def find_all_by_id(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |x|
      x.id == input
    end
  end

  def find_all_by_customer_id(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |x|
      x.customer_id == input
    end
  end

  def find_all_by_merchant_id(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |x|
      x.merchant_id == input
    end
  end

  def find_all_by_status(input)
    @invoices.find_all do |x|
      x.status == input
    end
  end

  def find_all_by_created_at(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |x|
      x.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    #test if doesn't find it then it returns nil
    @invoices.find_all do |x|
      x.updated_at == input
    end
  end
end
