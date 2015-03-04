require 'csv'
require_relative 'merchant'

class MerchantParser

  def call(file)
    merchants = CSV.open(file, {:headers => true} )
    merchant_array = []

    merchants.each do |merchant|
      merchant_array << Merchant.new(merchant["id"], merchant["name"], merchant["created_at"], merchant["updated_at"])
    end

    merchant_array
  end

end

