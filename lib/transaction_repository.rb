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
    @transactions.find do |x|
      x.id == input
    end
  end

  def find_by_invoice_id(input)
    @transactions.find do |x|
      x.invoice_id == input
    end
  end

  def find_by_credit_card_number(input)
    @transactions.find do |x|
      x.credit_card_number == input
    end
  end

  def find_by_credit_card_expiration_date(input)
    @transactions.find do |x|
      x.credit_card_expiration_date == input
    end
  end

  def find_by_result(input)
    @transactions.find do |x|
      x.result == input
    end
  end

  def find_by_created_at(input)
    @transactions.find do |x|
      x.created_at == input
    end
  end

  def find_by_updated_at(input)
    @transactions.find do |x|
      x.updated_at == input
    end
  end

  def find_all_by_id(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |x|
      x.id == input
    end
  end

  def find_all_by_invoice_id(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |x|
      x.invoice_id == input
    end
  end

  def find_all_by_credit_card_number(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |x|
      x.credit_card_number == input
    end
  end

  def find_all_by_credit_card_expiration_date(input)
    @transactions.find_all do |x|
      x.credit_card_expiration_date == input
    end
  end

  def find_all_by_result(input)
    @transactions.find_all do |x|
      x.result == input
    end
  end

  def find_all_by_created_at(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |x|
      x.created_at == input
    end
  end

  def find_all_by_updated_at(input)
    #test if doesn't find it then it returns nil
    @transactions.find_all do |x|
      x.updated_at == input
    end
  end
end
