require_relative 'test_helper'
require_relative "../lib/invoice_items_repository"
require_relative "../lib/invoice_items_parser"

class InvoiceItemsRepositoryTest < Minitest::Test
  def invoice_items_parser
    InvoiceItemsParser.new.call("./data/fake_invoice_items.csv")
  end

  def invoice_items_repo
    InvoiceItemsRepository.new(invoice_items_parser)
  end

  def test_all
    array_fake_invoice_itemss = Object.new
    invoice_items_repository = InvoiceItemsRepository.new(array_fake_invoice_itemss)
    assert_equal array_fake_invoice_itemss, invoice_items_repository.all
  end

  def test_random_empty
    array_fake_invoice_itemss = []
    invoice_items_repository = InvoiceItemsRepository.new(array_fake_invoice_itemss)
    assert_equal nil, invoice_items_repository.random
  end

  def test_random_one
    fake_invoice_items = Object.new
    array_fake_invoice_itemss = [fake_invoice_items]
    invoice_items_repository = InvoiceItemsRepository.new(array_fake_invoice_itemss)
    assert_equal fake_invoice_items, invoice_items_repository.random
  end

  def test_find_by_id
    assert_equal "539", invoice_items_repo.find_by_id("1").item_id
  end  

  def test_find_by_id_where_id_does_not_exist
    assert_equal nil, invoice_items_repo.find_by_id("101")
  end

  def test_find_by_item_id
    assert_equal "4", invoice_items_repo.find_by_item_id("535").id
  end   

  def test_find_by_invoice_id
    assert_equal "1", invoice_items_repo.find_by_invoice_id("1").id
  end 

  def test_find_by_quantity
    assert_equal "1", invoice_items_repo.find_by_quantity("5").id
  end 

  def test_find_by_unit_price
    assert_equal "9", invoice_items_repo.find_by_unit_price("29973").id
  end       

  def test_find_by_created_at
    assert_equal "1", invoice_items_repo.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_by_updated_at
    assert_equal "1", invoice_items_repo.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end    

  def test_find_all_by_id
    assert_equal 1, invoice_items_repo.find_all_by_id("1").count
  end  

  def test_find_all_by_id_where_id_does_not_exist
    assert_equal 0, invoice_items_repo.find_all_by_id("101").count
  end

  def test_find_all_by_item_id
    assert_equal 1, invoice_items_repo.find_all_by_item_id("535").count
  end   

  def test_find_all_by_invoice_id
    assert_equal 8, invoice_items_repo.find_all_by_invoice_id("1").count
  end 

  def test_find_all_by_quantity
    assert_equal 2, invoice_items_repo.find_all_by_quantity("5").count
  end 

  def test_find_all_by_unit_price
    assert_equal 1, invoice_items_repo.find_all_by_unit_price("29973").count
  end       

  def test_find_all_by_created_at
    assert_equal 12, invoice_items_repo.find_all_by_created_at("2012-03-27 14:54:09 UTC").count
  end

  def test_find_all_by_updated_at
    assert_equal 12, invoice_items_repo.find_all_by_updated_at("2012-03-27 14:54:09 UTC").count
  end   
end
