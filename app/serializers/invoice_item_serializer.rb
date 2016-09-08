class InvoiceItemSerializer < ActiveModel::Serializer
  include Utils
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at
  attribute :formatted_unit_price, key: :unit_price

  def formatted_unit_price
    "#{convert_to_dollars(object.unit_price)}"
  end
end
