require_relative 'test_helper'
require_relative '../lib/item_parser'

class ItemParserTest < Minitest::Test

  def test_it_exists
    assert ItemParser
  end

  def test_it_returns_array_of_one_item
    output = ItemParser.call("./data/fake_items.csv")
    assert output
  end

  def test_it_returns_array_of_multiple_items
    output = ItemParser.call("./data/fake_items.csv")
    assert_equal 9, output.count
  end

  def test_it_returns_array_of_all_items
    output = ItemParser.call("./data/items.csv")
    assert_equal 2483, output.count
  end


end
