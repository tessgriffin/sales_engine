class Transaction

  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at, :repo

  def initialize(id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, updated_at, repo)
    @id = id
    @invoice_id = invoice_id
    @credit_card_number = credit_card_number
    @credit_card_expiration_date = credit_card_expiration_date
    @result = result
    @created_at = created_at
    @updated_at = updated_at
    @repo = repo
  end

  def invoice(id)
    @repo.find_invoice(id)
  end

end
