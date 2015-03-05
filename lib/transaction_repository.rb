class TransactionRepository
  def initialize(transactions, sales_engine)
    @transactions = transactions
    @sales_engine = sales_engine
  end

  def all
    @transactions
  end

  def random
    @transactions.sample(1).first
  end

  def find_by_id(input)
    @transactions.find do |transaction|
      transaction.id == input
    end
  end

  def find_by_invoice_id(input)
    @transactions.find do |transaction|
      transaction.invoice_id == input
    end
  end

  def find_by_credit_card_number(input)
    @transactions.find do |transaction|
      transaction.credit_card_number == input
    end
  end

  def find_by_credit_card_expiration_date(input)
    @transactions.find do |transaction|
      transaction.credit_card_expiration_date == input
    end
  end

  def find_by_result(input)
    @transactions.find do |transaction|
      transaction.result == input
    end
  end

  def find_by_created_at(input)
    @transactions.find do |transaction|
      transaction.created_at == input
    end
  end

  def find_by_updated_at(input)
    @transactions.find do |transaction|
      transaction.updated_at == input
    end
  end

  def find_all_by_id(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |transaction|
      transaction.id == input
    end
  end

  def find_all_by_invoice_id(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |transaction|
      transaction.invoice_id == input
    end
  end

  def find_all_by_credit_card_number(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |transaction|
      transaction.credit_card_number == input
    end
  end

  def find_all_by_credit_card_expiration_date(input)
    @transactions.find_all do |transaction|
      transaction.credit_card_expiration_date == input
    end
  end

  def find_all_by_result(input)
    @transactions.find_all do |transaction|
      transaction.result == input
    end
  end

  def find_all_by_created_at(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |transaction|
      transaction.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |transaction|
      transaction.updated_at == input
    end
  end
end
