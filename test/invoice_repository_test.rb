require_relative 'test_helper'
require_relative "../lib/invoice_repository"
require_relative "../lib/invoice_parser"
require_relative "../lib/sales_engine"

class InvoiceRepositoryTest < Minitest::Test

  attr_reader :se

  def setup
    #@fake_data =

    @se = Minitest::Mock.new
  end

  #get rid of this:
  def invoice_parser
    InvoiceParser.call("./data/invoices.csv")
  end

  #get rid of this:
  def sales_engine
    SalesEngine.new
  end

  def invoice_repo
    #make invoice_parser @fake_data
    InvoiceRepository.new(invoice_parser, @se)
  end

  def test_it_knows_its_parent
    skip
    engine = SalesEngine.new
    repo = CustomerRepository.new(@fake_data, engine)
    assert_equal engine, repo.sales_engine
  end

  def test_all
    skip
    repo = InvoiceRepository.new(@fake_data, @se)
    assert_equal repo.invoices, repo.all
  end

  def test_random_one
    skip
    repo = InvoiceRepository.new(@fake_data, @se)
    assert_equal Invoice, repo.random.class
  end

  def test_find_by_id
    assert_equal "shipped", invoice_repo.find_by_id("5").status
  end

  def test_find_by_customer_id
    assert_equal "26", invoice_repo.find_by_customer_id("1").merchant_id
  end

  def test_find_by_merchant_id
    assert_equal "3", invoice_repo.find_by_merchant_id("86").customer_id
  end

  def test_find_by_status
    assert_equal "1", invoice_repo.find_by_status("shipped").id
  end

  def test_find_by_created_at
    assert_equal "26", invoice_repo.find_by_created_at("2012-03-25 09:54:09 UTC").merchant_id
  end

  def test_find_by_updated_at
    assert_equal "75", invoice_repo.find_by_updated_at("2012-03-12 05:54:09 UTC").merchant_id
  end

  def test_find_all_by_id
    assert_equal 1, invoice_repo.find_all_by_id("16").count
  end

  def test_find_all_by_customer_id
    assert_equal 8, invoice_repo.find_all_by_customer_id("1").count
  end

  def test_find_all_by_merchant_id
    assert_equal 48, invoice_repo.find_all_by_merchant_id("26").count
  end

  def test_find_all_by_status
    assert_equal 4843, invoice_repo.find_all_by_status("shipped").count
  end

  def test_find_all_by_created_at
    assert_equal 1, invoice_repo.find_all_by_created_at("2012-03-25 09:54:09 UTC").count
  end

  def test_find_all_by_updated_at
    assert_equal 1, invoice_repo.find_all_by_updated_at("2012-03-25 09:54:09 UTC").count
  end
end
