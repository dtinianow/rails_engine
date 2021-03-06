require 'rails_helper'

describe "Invoices Invoice Items" do
  fixtures :invoices
  fixtures :items

  context "#Index" do

    it 'returns JSON data on all items belonging to an invoice' do
      get '/api/v1/invoices/1/items'

      items = JSON.parse(response.body)
      item  = items.first

      expect(response).to be_success
      expect(items.class).to eq(Array)
      expect(item.class).to eq(Hash)
      expect(item['id']).to eq(1)
      expect(item['name']).to eq('Golf Club')
      expect(item['description']).to eq('Intended to strike golf balls.')
      expect(item['unit_price']).to eq('100.01')
      expect(item['merchant_id']).to eq(1)
    end
  end
end
