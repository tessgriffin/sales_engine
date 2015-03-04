require 'csv'
require_relative 'transaction'
require_relative 'transaction_repository'

class TransactionParser
  def call(file)
    transactions = CSV.open(file, {:headers => true} )
    transaction_array = []

    transactions.each do |transaction|
      transaction_array << Transaction.new(transaction["id"], transaction["invoice_id"], transaction["credit_card_number"], transaction["credit_card_expiration_date"], transaction["result"], transaction["created_at"], transaction["updated_at"])
    end

    transaction_array
  end
end
