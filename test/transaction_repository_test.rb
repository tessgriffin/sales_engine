require_relative 'test_helper'
require_relative "../lib/transaction_repository"
require_relative "../lib/sales_engine"

class TransactionRepositoryTest < Minitest::Test
  attr_reader :se

  def setup
    @fake_data = [
      {
        "id" => 1,
        "invoice_id" => 56,
        "credit_card_number" => "4565654576890987",
        "credit_card_expiration_date" => "2016",
        "result" => "success",
        "created_at" => "2012",
        "updated_at" => "2013",
      },
      {
        "id" => 2,
        "invoice_id" => 85,
        "credit_card_number" => "4565654576890988",
        "credit_card_expiration_date" => "2016",
        "result" => "failure",
        "created_at" => "2013",
        "updated_at" => "2014",
      },
      {
        "id" => 3,
        "invoice_id" => 187,
        "credit_card_number" => "4565654576890989",
        "credit_card_expiration_date" => "2016",
        "result" => "success",
        "created_at" => "2012",
        "updated_at" => "2013",
      },
      {
        "id" => 4,
        "invoice_id" => 93,
        "credit_card_number" => "4565654576890980",
        "credit_card_expiration_date" => "2016",
        "result" => "success",
        "created_at" => "2012",
        "updated_at" => "2013",
      }
    ]

    @se = Minitest::Mock.new
  end

  def transaction_repo
    TransactionRepository.new(@fake_data, @se)
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new("file")
    repo = TransactionRepository.new(@fake_data, engine)
    assert_equal engine, repo.sales_engine
  end

  def test_all
    repo = TransactionRepository.new(@fake_data, @se)
    assert_equal repo.transactions, repo.all
  end

  def test_random_one
    repo = TransactionRepository.new(@fake_data, @se)
    assert_equal Transaction, repo.random.class
  end

  def test_find_by_id
    assert_equal "4565654576890987", transaction_repo.find_by_id(1).credit_card_number
  end

  def test_find_by_invoice_id
    assert_equal "4565654576890987", transaction_repo.find_by_invoice_id(56).credit_card_number
  end

  def test_find_by_credit_card_number
    assert_equal 1, transaction_repo.find_by_credit_card_number("4565654576890987").id
  end

  def test_find_by_credit_card_expiration_date
    assert_equal 56, transaction_repo.find_by_credit_card_expiration_date("2016").invoice_id
  end

  def test_find_by_result
    assert_equal 1, transaction_repo.find_by_result("success").id
    assert_equal 2, transaction_repo.find_by_result("failure").id
  end

  def test_find_by_created_at
    assert_equal 1, transaction_repo.find_by_created_at("2012").id
  end

  def test_find_by_updated_at
    assert_equal 1, transaction_repo.find_by_updated_at("2013").id
  end

  def test_find_all_by_id
    assert_equal 1, transaction_repo.find_all_by_id(4).count
  end

  def test_find_all_by_invoice_id
    assert_equal 1, transaction_repo.find_all_by_invoice_id(187).count
  end

  def test_find_all_by_credit_card_number
    assert_equal 1, transaction_repo.find_all_by_credit_card_number("4565654576890989").count
  end

  def test_find_all_by_credit_card_expiration_date
    assert_equal 4, transaction_repo.find_all_by_credit_card_expiration_date("2016").count
  end

  def test_find_all_by_result
    assert_equal 3, transaction_repo.find_all_by_result("success").count
    assert_equal 1, transaction_repo.find_all_by_result("failure").count
  end

  def test_find_all_by_created_at
    assert_equal 3, transaction_repo.find_all_by_created_at("2012").count
  end

  def test_find_all_by_updated_at
    assert_equal 1, transaction_repo.find_all_by_updated_at("2014").count
  end

  def test_it_can_talk_to_parent_for_invoices
    parent = Minitest::Mock.new
    repo = TransactionRepository.new(@fake_data, parent)
    parent.expect(:find_invoice_by_id, [1, 2], [56])
    assert_equal [1, 2], repo.find_invoice(56)
    parent.verify
  end
end
