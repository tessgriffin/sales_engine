require_relative 'test_helper'
require_relative "../lib/sales_engine"


class SalesEngineTest < Minitest::Test

  def test_it_exists
    assert SalesEngine
  end

  def test_it_starts_up
    engine = SalesEngine.new
    assert engine.startup
  end

  def test_it_has_a_customer_repo_when_started_up
    engine = SalesEngine.new
    engine.startup
    assert engine.customer_repository
  end

  def test_it_has_a_merchant_repo_when_started_up
    engine = SalesEngine.new
    engine.startup
    assert engine.merchant_repository
  end

  def test_it_has_an_item_repo_when_started_up
    engine = SalesEngine.new
    engine.startup
    assert engine.item_repository
  end

  def test_it_can_find_items_by_merchant_id
    engine = SalesEngine.new
    engine.startup
    items = engine.find_items_by_merchant_id("2")

    assert_equal 38, items.count
  end

end
