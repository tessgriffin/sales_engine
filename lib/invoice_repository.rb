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
end
