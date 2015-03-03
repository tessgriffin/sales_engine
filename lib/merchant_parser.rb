require 'csv'
require_relative 'merchant'
require_relative 'merchant_repository'

merchants = CSV.open("../data/merchants.csv", {:headers => true} )
merchant_array = []

merchants.each do |merchant|
  merchant_array << Merchant.new(merchant["id"], merchant["name"], merchant["created_at"], merchant["updated_at"])
end

repository = File.open("./merchant_repository")
