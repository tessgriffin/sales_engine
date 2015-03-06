require_relative 'test_helper'
require_relative "../lib/item_repository"
require_relative "../lib/item_parser"

class ItemRepositoryTest < Minitest::Test
  def item_parser
    ItemParser.new.call("./data/fake_items.csv")
  end

  def item_repo
    ItemRepository.new(item_parser)
  end

  def test_all
    array_fake_items = Object.new
    item_repository = ItemRepository.new(array_fake_items)
    assert_equal array_fake_items, item_repository.all
  end

  def test_random_empty
    array_fake_items = []
    item_repository = ItemRepository.new(array_fake_items)
    assert_equal nil, item_repository.random
  end

  def test_random_one
    fake_item = Object.new
    array_fake_items = [fake_item]
    item_repository = ItemRepository.new(array_fake_items)
    assert_equal fake_item, item_repository.random
  end

  def test_find_by_id
    assert_equal "Item Qui Esse", item_repo.find_by_id("1").name
  end  

  def test_find_by_id_where_id_does_not_exist
    assert_equal nil, item_repo.find_by_id("101")
  end  

  def test_find_by_name
    assert_equal "2", item_repo.find_by_name("Item Autem Minima").id
  end 

  def test_find_by_description
    assert_equal "1", item_repo.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").id
  end 

  def test_find_by_unit_price
    assert_equal "2", item_repo.find_by_unit_price("67076").id
  end   

  def test_find_by_merchant_id
    assert_equal "1", item_repo.find_by_merchant_id("1").id
  end    

  def test_find_by_created_at
    assert_equal "1", item_repo.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_by_updated_at
    assert_equal "1", item_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end    

  def test_find_all_by_id
    assert_equal 1, item_repo.find_all_by_id("1").count
  end  

  def test_find_all_by_id_where_id_does_not_exist
    assert_equal 0, item_repo.find_all_by_id("101").count
  end  

  def test_find_all_by_name
    assert_equal 1, item_repo.find_all_by_name("Item Autem Minima").count
  end 

  def test_find_all_by_description
    assert_equal 1, item_repo.find_all_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").count
  end 

  def test_find_all_by_unit_price
    assert_equal 1, item_repo.find_all_by_unit_price("67076").count
  end   

  def test_find_all_by_merchant_id
    assert_equal 9, item_repo.find_all_by_merchant_id("1").count
  end    

  def test_find_all_by_created_at
    assert_equal 9, item_repo.find_all_by_created_at("2012-03-27 14:53:59 UTC").count
  end

  def test_find_all_by_updated_at
    assert_equal 9, item_repo.find_all_by_updated_at("2012-03-27 14:53:59 UTC").count
  end
  
end
