require 'minitest/autorun'
require 'minitest/pride'
require "../lib/item_repository"

class ItemRepositoryTest < Minitest::Test
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
end
