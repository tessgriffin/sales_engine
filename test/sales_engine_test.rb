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

end