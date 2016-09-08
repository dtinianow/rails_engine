class MerchantTotalRevenueSerializer < ActiveModel::Serializer
  include Utils
  attributes :total_revenue

  def total_revenue
    "#{convert_to_dollars(object)}"
  end
end
