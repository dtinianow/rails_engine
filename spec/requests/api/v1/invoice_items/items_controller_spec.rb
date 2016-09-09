require 'rails_helper'

describe "InvoiceItems Item" do
  fixtures :invoice_items
  fixtures :items

  context "#Show" do
    it 'returns JSON data on an invoice items item matching id params' do
      get '/api/v1/invoice_items/1/item'

      item = JSON.parse(response.body)

      expect(item.class).to eq(Hash)
      expect(response).to be_success
      expect(item['id']).to eq(1)
      expect(item['name']).to eq('Golf Club')
      expect(item['description']).to eq('Intended to strike golf balls.')
      expect(item['merchant_id']).to eq(1)
      expect(item['unit_price']).to eq('100.01')
    end
  end
end
