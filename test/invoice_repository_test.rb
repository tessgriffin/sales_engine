require_relative 'test_helper'
require_relative "../lib/invoice_repository"
require_relative "../lib/invoice_parser"
require_relative "../lib/sales_engine"

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :se

  def setup
    @fake_data = [
      {
        "id" => 1,
        "customer_id" => 12,
        "merchant_id" => 31,
        "status" => "shipped",
        "created_at" => "2012",
        "updated_at" => "2013",
      },
      {
        "id" => 2,
        "customer_id" => 14,
        "merchant_id" => 35,
        "status" => "shipped",
        "created_at" => "2012",
        "updated_at" => "2013",
      },
      {
        "id" => 3,
        "customer_id" => 11,
        "merchant_id" => 38,
        "status" => "not shipped",
        "created_at" => "2013",
        "updated_at" => "2014",
      },
      {
        "id" => 4,
        "customer_id" => 12,
        "merchant_id" => 22,
        "status" => "shipped",
        "created_at" => "2014",
        "updated_at" => "2015",
      }
    ]

    @se = Minitest::Mock.new
  end

  def invoice_repo
    InvoiceRepository.new(@fake_data, @se)
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new("file")
    repo = InvoiceRepository.new(@fake_data, engine)
    assert_equal engine, repo.sales_engine
  end

  def test_all
    repo = InvoiceRepository.new(@fake_data, @se)
    assert_equal repo.invoices, repo.all
  end

  def test_random_one
    repo = InvoiceRepository.new(@fake_data, @se)
    assert_equal Invoice, repo.random.class
  end

  def test_find_by_id
    assert_equal "not shipped", invoice_repo.find_by_id(3).status
  end

  def test_find_by_customer_id
    assert_equal 31, invoice_repo.find_by_customer_id(12).merchant_id
  end

  def test_find_by_merchant_id
    assert_equal 14, invoice_repo.find_by_merchant_id(35).customer_id
  end

  def test_find_by_status
    assert_equal 3, invoice_repo.find_by_status("not shipped").id
  end

  def test_find_by_created_at
    assert_equal 22, invoice_repo.find_by_created_at("2014").merchant_id
  end

  def test_find_by_updated_at
    assert_equal 22, invoice_repo.find_by_updated_at("2015").merchant_id
  end

  def test_find_all_by_id
    assert_equal 1, invoice_repo.find_all_by_id(2).count
  end

  def test_find_all_by_customer_id
    assert_equal 2, invoice_repo.find_all_by_customer_id(12).count
  end

  def test_find_all_by_merchant_id
    assert_equal 1, invoice_repo.find_all_by_merchant_id(31).count
  end

  def test_find_all_by_status
    assert_equal 3, invoice_repo.find_all_by_status("shipped").count
  end

  def test_find_all_by_created_at
    assert_equal 2, invoice_repo.find_all_by_created_at("2012").count
  end

  def test_find_all_by_updated_at
    assert_equal 2, invoice_repo.find_all_by_updated_at("2013").count
  end

  def test_it_can_talk_to_parent_for_transactions
    parent = Minitest::Mock.new
    repo = InvoiceRepository.new(@fake_data, parent)
    parent.expect(:find_transactions_by_invoice_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_transactions(1)
    parent.verify
  end

  def test_it_can_talk_to_parent_for_invoice_items
    parent = Minitest::Mock.new
    repo = InvoiceRepository.new(@fake_data, parent)
    parent.expect(:find_invoice_items_by_invoice_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_invoice_items(1)
    parent.verify
  end

  def test_it_can_talk_to_parent_for_items
    parent = Minitest::Mock.new
    repo = InvoiceRepository.new(@fake_data, parent)
    parent.expect(:find_items_by_invoice_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_items(1)
    parent.verify
  end

  def test_it_can_talk_to_parent_for_customer
    parent = Minitest::Mock.new
    repo = InvoiceRepository.new(@fake_data, parent)
    parent.expect(:find_customer_by_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_customer(1)
    parent.verify
  end

  def test_it_can_talk_to_parent_for_merchant
    parent = Minitest::Mock.new
    repo = InvoiceRepository.new(@fake_data, parent)
    parent.expect(:find_merchant_by_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_merchant(1)
    parent.verify
  end
end
