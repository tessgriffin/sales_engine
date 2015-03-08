require_relative 'transaction_parser'
require_relative 'transaction'

class TransactionRepository
  attr_reader :transactions, :sales_engine

  def initialize(parsed_data, sales_engine)
    @transactions = parsed_data.map do |transaction|
      Transaction.new(
        transaction["id"],
        transaction["invoice_id"],
        transaction["credit_card_number"],
        transaction["credit_card_expiration_date"],
        transaction["result"],
        transaction["created_at"],
        transaction["updated_at"],
        self,
      )
    end
    @sales_engine = sales_engine
  end

  def all
    transactions
  end

  def random
    transactions.sample(1).first
  end

  def find_by_id(input)
    transactions.find do |transaction|
      transaction.id == input
    end
  end

  def find_by_invoice_id(input)
    transactions.find do |transaction|
      transaction.invoice_id == input
    end
  end

  def find_by_credit_card_number(input)
    transactions.find do |transaction|
      transaction.credit_card_number == input
    end
  end

  def find_by_credit_card_expiration_date(input)
    transactions.find do |transaction|
      transaction.credit_card_expiration_date == input
    end
  end

  def find_by_result(input)
    transactions.find do |transaction|
      transaction.result == input
    end
  end

  def find_by_created_at(input)
    transactions.find do |transaction|
      transaction.created_at == input
    end
  end

  def find_by_updated_at(input)
    transactions.find do |transaction|
      transaction.updated_at == input
    end
  end

  def find_all_by_id(input)
    transactions.find_all do |transaction|
      transaction.id == input
    end
  end

  def find_all_by_invoice_id(input)
    transactions.find_all do |transaction|
      transaction.invoice_id == input
    end
  end

  def find_all_by_credit_card_number(input)
    transactions.find_all do |transaction|
      transaction.credit_card_number == input
    end
  end

  def find_all_by_credit_card_expiration_date(input)
    transactions.find_all do |transaction|
      transaction.credit_card_expiration_date == input
    end
  end

  def find_all_by_result(input)
    transactions.find_all do |transaction|
      transaction.result == input
    end
  end

  def find_all_by_created_at(input)
    transactions.find_all do |transaction|
      transaction.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    transactions.find_all do |transaction|
      transaction.updated_at == input
    end
  end

  def find_invoice(id)
    sales_engine.find_invoice_by_transaction_id(id)
  end
end
