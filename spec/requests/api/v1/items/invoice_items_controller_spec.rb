require 'rails_helper'

describe "Item's Invoice Items Index" do
  fixtures :items
  fixtures :invoice_items

  context "#Index" do
    it 'returns JSON data on all invoice items matching item id params' do
      get '/api/v1/items/2/invoice_items'

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_success
      expect(invoice_items.length).to eq(1)
      expect(invoice_items.class).to eq(Array)
      expect(invoice_item.class).to eq(Hash)
      expect(invoice_item['id']).to eq(2)
      expect(invoice_item['item_id']).to eq(2)
      expect(invoice_item['invoice_id']).to eq(2)
      expect(invoice_item['quantity']).to eq(10)
      expect(invoice_item['unit_price']).to eq('2000.20')
    end
  end
end
