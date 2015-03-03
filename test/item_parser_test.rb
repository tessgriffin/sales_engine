require 'minitest/autorun'
require 'minitest/pride'
require '../lib/item_parser'

class ItemParserTest < Minitest::Test

  def test_it_exists
    assert ItemParser
  end

  def test_it_returns_array_of_one_item
    items = ItemParser.new
    output = items.parse_items("../data/fake_items.csv")
    assert output
  end

  def test_it_returns_array_of_2_items
    items = ItemParser.new
    output = items.parse_items("../data/fake_items.csv")
    assert_equal 2, output.count
  end

  def test_it_returns_array_of_2483_items
    items = ItemParser.new
    output = items.parse_items("../data/items.csv")
    assert_equal 2483, output.count
  end

end