require 'csv'
require_relative 'merchant'

class MerchantParser
  def self.call(file_name)
    CSV.open(file_name, {:headers => true} )
  end
end

