require_relative 'test_helper'
require_relative '../lib/item'

class ItemsTest < Minitest::Test
  def test_it_exists
    assert Item
  end

  def test_it_has_an_id
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "1", item.id
  end

  def test_it_has_a_name
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "Item Name", item.name
  end

  def test_it_has_a_description
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "Description", item.description
  end

  def test_it_has_a_unit_price
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "75107", item.unit_price
  end

  def test_it_has_a_merchant_id
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "1", item.merchant_id
  end

  def test_it_has_a_created_at
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:55:59 UTC", "repo")
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_it_has_an_updated_at
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:55:59 UTC", "repo")
    assert_equal "2012-03-27 14:55:59 UTC", item.updated_at
  end

  def test_it_knows_parent
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:55:59 UTC", "repo")
    assert_equal "repo", item.repo
  end

  def test_it_finds_invoice_items_for_item
    parent = Minitest::Mock.new
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:55:59 UTC", parent)
    parent.expect(:find_invoice_items, [1, 2], [item.id])
    assert_equal [1, 2], item.invoice_items
    parent.verify
  end

  def test_it_finds_merchant_for_item
    parent = Minitest::Mock.new
    item = Item.new("1", "Item Name", "Description", "75107", "1", "2012-03-27 14:53:59 UTC", "2012-03-27 14:55:59 UTC", parent)
    parent.expect(:find_merchant, [2], [item.merchant_id])
    assert_equal [2], item.merchant
    parent.verify
  end
end
