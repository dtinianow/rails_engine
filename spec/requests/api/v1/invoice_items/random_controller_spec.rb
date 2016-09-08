require 'rails_helper'

describe "Invoice Items Random" do
  fixtures :invoice_items

  context '#Show' do

    it 'returns JSON data on random invoice_items' do
      get '/api/v1/invoice_items/random'

      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item.class).to eq(Hash)
      expect(invoice_item).to have_key('id')
      expect(invoice_item).to have_key('item_id')
      expect(invoice_item).to have_key('invoice_id')
      expect(invoice_item).to have_key('quantity')
      expect(invoice_item).to have_key('unit_price')
    end
  end
end
