require 'csv'

class InvoiceItemParser
  def self.call(file_name)
    CSV.open(file_name, {:headers => true} )
  end
end