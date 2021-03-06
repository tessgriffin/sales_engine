require_relative 'test_helper'
require_relative "../lib/transaction"

class TransactionTest < Minitest::Test
  def test_it_exists
    assert Transaction
  end

  def test_it_has_an_id
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal 1, transaction.id
  end

  def test_it_has_an_invoice_id
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal 20, transaction.invoice_id
  end

  def test_it_has_a_credit_card_number
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "credit_card_number", transaction.credit_card_number
  end

  def test_it_has_a_credit_card_expiration_date
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "expiration", transaction.credit_card_expiration_date
  end

  def test_it_has_a_result
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "result", transaction.result
  end

  def test_it_has_a_created_at
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", transaction.created_at
  end

  def test_it_has_an_updated_at
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "2012-03-27 14:53:59 UTC", transaction.updated_at
  end

  def test_it_has_a_transaction_repository
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repository")
    assert_equal "repository", transaction.repo
  end

  def test_it_can_talk_to_parent_invoice_method
    parent = Minitest::Mock.new
    transaction = Transaction.new(1, 20, "credit_card_number", "expiration", "result", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", parent)
    parent.expect(:find_invoice, [1, 2], [20])
    assert_equal [1, 2], transaction.invoice
    parent.verify
  end
end
