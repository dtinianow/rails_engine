class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at
  attribute :formatted_unit_price, key: :unit_price

  def formatted_unit_price
    "#{object.unit_price / 100.00}"
  end
end
