require 'minitest/autorun'
require 'minitest/pride'
require '../lib/item'

class ItemsTest < Minitest::Test

  def test_it_exists
    assert Item
  end

  def test_it_has_an_id
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "1", item.id
  end

  def test_it_has_a_name
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "Item Name", item.name
  end

  def test_it_has_a_description
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "Description", item.description
  end

  def test_it_has_a_unit_price
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "75107", item.unit_price
  end

  def test_it_has_a_merchant_id
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC")
    assert_equal "1", item.merchant_id
  end

  def test_it_has_a_created_at
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:55:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_it_has_an_updated_at
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:55:59 UTC")
    assert_equal "2012-03-27 14:55:59 UTC", item.updated_at
  end

end
