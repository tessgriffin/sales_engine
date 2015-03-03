class TransactionRepository
  def initialize(transactions)
    @transactions = transactions
  end

  def all
    @transactions
  end

  def random
    @transactions.sample(1).first
  end
end
