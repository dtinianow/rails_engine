require 'rails_helper'

describe "Item's best sellers by items" do
  fixtures :items
  fixtures :invoices
  fixtures :transactions

  context "#Index" do

    it 'returns JSON data on all best item sellers by items sold matching quantity params' do
      get '/api/v1/items/most_items?quantity=1'

      best_sellers = JSON.parse(response.body)
      best_seller = best_sellers.first

      expect(response).to be_success
      expect(best_sellers.length).to eq(1)
      expect(best_sellers.class).to eq(Array)

      expect(best_seller.class).to eq(Hash)
      expect(best_seller['id']).to eq(1)
      expect(best_seller['name']).to eq('Golf Club')
      expect(best_seller['description']).to eq("Intended to strike golf balls.")
      expect(best_seller['merchant_id']).to eq(1)
      expect(best_seller['unit_price']).to eq('100.01')
    end
  end
end
