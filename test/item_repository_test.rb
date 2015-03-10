require_relative 'test_helper'
require_relative "../lib/item_repository"
require_relative "../lib/sales_engine"

class ItemRepositoryTest < Minitest::Test
  attr_reader :se

  def setup
    @fake_data = [
      {
        "id" => 1,
        "name" => "Joe",
        "description" => "Hello Item",
        "unit_price" => 75107,
        "merchant_id" => 1,
        "created_at" => "2012",
        "updated_at" => "2013",
        "repo" => "repo"
      },
      {
        "id" => 2,
        "name" => "Jane",
        "description" => "Hello Item 2",
        "unit_price" => 75106,
        "merchant_id" => 1,
        "created_at" => "2013",
        "updated_at" => "2014",
        "repo" => "repo"
      },
      {
        "id" => 3,
        "name" => "Bill",
        "description" => "Hello Item 3",
        "unit_price" => 75106,
        "merchant_id" => 1,
        "created_at" => "2012",
        "updated_at" => "2013",
        "repo" => "repo"
      },
      {
        "id" => 4,
        "name" => "Nancy",
        "description" => "Hello Item 4",
        "unit_price" => 75106,
        "merchant_id" => 1,
        "created_at" => "2012",
        "updated_at" => "2013",
        "repo" => "repo"
      },
      {
        "id" => 5,
        "name" => "Spock",
        "description" => "Hello Item 5",
        "unit_price" => 75106,
        "merchant_id" => 1,
        "created_at" => "2012",
        "updated_at" => "2013",
        "repo" => "repo"
        },
      ]

    @se = Minitest::Mock.new
  end

  def item_repo
    ItemRepository.new(@fake_data, @se)
  end

  def test_it_knows_its_parent
    engine = SalesEngine.new("file")
    repo = ItemRepository.new(@fake_data, engine)
    assert_equal engine, repo.sales_engine
  end

  def test_all
    repo = ItemRepository.new(@fake_data, SalesEngine.new("file"))
    assert_equal repo.items, repo.all
  end

  def test_random_one
    repo = ItemRepository.new(@fake_data, SalesEngine.new("file"))
    assert_equal Item, repo.random.class
  end

  def test_find_by_id
    assert_equal "Joe", item_repo.find_by_id(1).name
  end

  def test_find_by_id_where_id_does_not_exist
    assert_equal nil, item_repo.find_by_id(101)
  end

  def test_find_by_name
    assert_equal 2, item_repo.find_by_name("Jane").id
  end

  def test_find_by_description
    assert_equal 1, item_repo.find_by_description("Hello Item").id
  end

  def test_find_by_unit_price
    assert_equal 2, item_repo.find_by_unit_price(BigDecimal.new("751.06")).id
  end

  def test_find_by_merchant_id
    assert_equal 1, item_repo.find_by_merchant_id(1).id
  end

  def test_find_by_created_at
    assert_equal 1, item_repo.find_by_created_at("2012").id
  end

  def test_find_by_updated_at
    assert_equal 1, item_repo.find_by_updated_at("2013").id
  end

  def test_find_all_by_id
    assert_equal 1, item_repo.find_all_by_id(1).count
  end

  def test_find_all_by_id_where_id_does_not_exist
    assert_equal 0, item_repo.find_all_by_id(101).count
  end

  def test_find_all_by_name
    assert_equal 1, item_repo.find_all_by_name("Joe").count
  end

  def test_find_all_by_description
    assert_equal 1, item_repo.find_all_by_description("Hello Item 2").count
  end

  def test_find_all_by_unit_price
    assert_equal 4, item_repo.find_all_by_unit_price(BigDecimal.new("751.06")).count
  end

  def test_find_all_by_merchant_id
    assert_equal 5, item_repo.find_all_by_merchant_id(1).count
  end

  def test_find_all_by_created_at
    assert_equal 4, item_repo.find_all_by_created_at("2012").count
  end

  def test_find_all_by_updated_at
    assert_equal 1, item_repo.find_all_by_updated_at("2014").count
  end

  def test_it_can_talk_to_parent_for_invoice_items
    parent = Minitest::Mock.new
    repo = ItemRepository.new(@fake_data, parent)
    parent.expect(:find_invoice_items_by_item_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_invoice_items(1)
    parent.verify
  end

  def test_it_can_talk_to_parent_for_merchant
    parent = Minitest::Mock.new
    repo = ItemRepository.new(@fake_data, parent)
    parent.expect(:find_merchant_by_id, [1, 2], [1])
    assert_equal [1, 2], repo.find_merchant(1)
    parent.verify
  end
end
