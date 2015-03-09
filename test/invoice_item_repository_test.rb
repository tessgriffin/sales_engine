require_relative 'test_helper'
require_relative "../lib/invoice_item_repository"
require_relative "../lib/sales_engine"

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :se

  def setup
    @fake_data = [
      {
        "id" => 1,
        "item_id" => 539, 
        "invoice_id" => 13635, 
        "quantity" => 1, 
        "unit_price" => 75107, 
        "created_at" => "2012", 
        "updated_at" => "2013", 
        "repo" => "repo"
      },
      {
        "id" => 2,
        "item_id" => 528, 
        "invoice_id" => 13635, 
        "quantity" => 1, 
        "unit_price" => 75106, 
        "created_at" => "2013", 
        "updated_at" => "2014", 
        "repo" => "repo"
      },
      {
        "id" => 3,
        "item_id" => 523,
        "invoice_id" => 13635, 
        "quantity" => 1, 
        "unit_price" => 75106, 
        "created_at" => "2012", 
        "updated_at" => "2013", 
        "repo" => "repo"
      },
      {
        "id" => 4,
        "item_id" => 535, 
        "invoice_id" => 13635, 
        "quantity" => 1, 
        "unit_price" => 75106, 
        "created_at" => "2012", 
        "updated_at" => "2013", 
        "repo" => "repo"
      },
      {
        "id" => 5,
        "item_id" => 529, 
        "invoice_id" => 13635, 
        "quantity" => 1, 
        "unit_price" => 75106, 
        "created_at" => "2012", 
        "updated_at" => "2013", 
        "repo" => "repo"
      },
      ]

    @se = Minitest::Mock.new
  end

  def invoice_items_repo
    InvoiceItemRepository.new(@fake_data, @se)
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new("file")
    repo = InvoiceItemRepository.new(@fake_data, engine)
    assert_equal engine, repo.sales_engine
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new("file")
    repo = InvoiceItemRepository.new(@fake_data, engine)
    assert_equal engine, repo.sales_engine
  end

  def test_all
    repo = InvoiceItemRepository.new(@fake_data, SalesEngine.new("file"))
    assert_equal repo.invoice_items, repo.all
  end

  def test_random_one
    repo = InvoiceItemRepository.new(@fake_data, SalesEngine.new("file"))
    assert_equal InvoiceItem, repo.random.class
  end

  def test_find_by_id
    assert_equal 539, invoice_items_repo.find_by_id(1).item_id
  end  

  def test_find_by_id_where_id_does_not_exist
    assert_equal nil, invoice_items_repo.find_by_id(101)
  end

  def test_find_by_item_id
    assert_equal 4, invoice_items_repo.find_by_item_id(535).id
  end   

  def test_find_by_invoice_id
    assert_equal 1, invoice_items_repo.find_by_invoice_id(13635).id
  end 

  def test_find_by_quantity
    assert_equal 1, invoice_items_repo.find_by_quantity(1).id
  end 

  def test_find_by_unit_price
    assert_equal 1, invoice_items_repo.find_by_unit_price(75107).id
  end       

  def test_find_by_created_at
    assert_equal 1, invoice_items_repo.find_by_created_at("2012").id
  end

  def test_find_by_updated_at
    assert_equal 1, invoice_items_repo.find_by_updated_at("2013").id
  end    

  def test_find_all_by_id
    assert_equal 1, invoice_items_repo.find_all_by_id(1).count
  end  

  def test_find_all_by_id_where_id_does_not_exist
    assert_equal 0, invoice_items_repo.find_all_by_id(101).count
  end

  def test_find_all_by_item_id
    assert_equal 1, invoice_items_repo.find_all_by_item_id(535).count
  end   

  def test_find_all_by_invoice_id
    assert_equal 5, invoice_items_repo.find_all_by_invoice_id(13635).count
  end 

  def test_find_all_by_quantity
    assert_equal 5, invoice_items_repo.find_all_by_quantity(1).count
  end 

  def test_find_all_by_unit_price
    assert_equal 1, invoice_items_repo.find_all_by_unit_price(75107).count
  end       

  def test_find_all_by_created_at
    assert_equal 4, invoice_items_repo.find_all_by_created_at("2012").count
  end

  def test_find_all_by_updated_at
    assert_equal 1, invoice_items_repo.find_all_by_updated_at("2014").count
  end  

  def test_it_can_talk_to_parent_for_invoice
    parent = Minitest::Mock.new
    repo = InvoiceItemRepository.new(@fake_data, parent)
    parent.expect(:find_invoice_by_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_invoice(1)
    parent.verify
  end 

  def test_it_can_talk_to_parent_for_item
    parent = Minitest::Mock.new
    repo = InvoiceItemRepository.new(@fake_data, parent)
    parent.expect(:find_item_by_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_item(1)
    parent.verify
  end
end
