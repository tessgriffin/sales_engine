require_relative 'test_helper'
require_relative "../lib/merchant"

class MerchantTest < Minitest::Test
  def test_it_exists
    assert Merchant
  end

  def test_it_has_an_id
    merchant = Merchant.new("1", "merchant first_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "1", merchant.id
  end

  def test_it_has_a_name
    merchant = Merchant.new("1", "merchant first_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "merchant first_name", merchant.name
  end

  def test_it_has_a_created_at
    merchant = Merchant.new("1", "merchant first_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:53:59 UTC", "repo")
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_it_has_an_updated_at
    merchant = Merchant.new("1", "merchant first_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:45:59 UTC", "repo")
    assert_equal "2012-03-27 14:45:59 UTC", merchant.updated_at
  end

  def test_it_knows_parent
    merchant = Merchant.new("1", "merchant first_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:45:59 UTC", "repo")
    assert_equal "repo", merchant.repo
  end

  def test_it_finds_items_for_merchant
    parent = Minitest::Mock.new
    merchant = Merchant.new("1", "merchant first_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:45:59 UTC", parent)
    parent.expect(:find_items, [1, 2], [merchant.id])
    assert_equal [1, 2], merchant.items
    parent.verify
  end

  def test_it_finds_invoices_for_merchant
    parent = Minitest::Mock.new
    merchant = Merchant.new("1", "merchant first_name", "2012-03-27 14:53:59 UTC", "2012-03-27 14:45:59 UTC", parent)
    parent.expect(:find_invoices, [1, 2], [merchant.id])
    assert_equal [1, 2], merchant.invoices
    parent.verify
  end
end
