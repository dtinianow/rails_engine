class ItemSerializer < ActiveModel::Serializer
  include Utils
  attributes :id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at

  def unit_price
    "#{convert_to_dollars(object.unit_price)}"
  end
end
