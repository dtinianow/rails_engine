class MerchantRevenueSerializer < ActiveModel::Serializer
  include Utils
  attributes :revenue

  def revenue
     "#{convert_to_dollars(object)}"
  end
end
