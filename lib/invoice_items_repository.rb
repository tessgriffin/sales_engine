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
end