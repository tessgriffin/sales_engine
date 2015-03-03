require 'csv'
require_relative 'item'

class ItemParser

  attr_reader :items_array

  def initialize
    @items_array = []
  end


  def parse_items(file)
    items = CSV.open("#{file}", {:headers => true} )

    items.each do |item|
      @items_array << Item.new(item["id"], item["name"], item["description"], item["unit_price"], item["merchant_id"], item["created_at"], item["updated_at"])
    end
    @items_array
  end

end
