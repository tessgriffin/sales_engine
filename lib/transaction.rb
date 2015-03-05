class Transaction

  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at, :transaction_repository

  def initialize(id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, updated_at, transaction_repository)
    @id = id
    @invoice_id = invoice_id
    @credit_card_number = credit_card_number
    @credit_card_expiration_date = credit_card_expiration_date
    @result = result
    @created_at = created_at
    @updated_at = updated_at
    @transaction_repository = transaction_repository
  end

end
