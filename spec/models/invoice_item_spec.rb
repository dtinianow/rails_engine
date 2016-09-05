require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should belong_to :invoice }
  it { should belong_to :item }

  it "should return total price" do
    invoice_item = InvoiceItem.create(
      item_id:    1,
      invoice_id: 1,
      quantity:   2,
      unit_price: 30000
    )

    expect(invoice_item.total_price).to eq(60000)
  end
end
