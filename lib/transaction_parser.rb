require 'csv'
require_relative 'transaction'

class TransactionParser
  def self.call(file_name)
    CSV.open(file_name, headers: true)
  end
end
