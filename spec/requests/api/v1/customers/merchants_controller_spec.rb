require 'rails_helper'

describe "Customer's Favorite Merchant" do
  fixtures :customers
  fixtures :merchants
  fixtures :invoices
  fixtures :transactions

  context "#Show" do

    it 'returns JSON data on customers favorite merchant matching id params' do
      get '/api/v1/customers/1/favorite_merchant'

      favorite_merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(favorite_merchant.class).to eq(Hash)
      expect(favorite_merchant['id']).to eq(1)
      expect(favorite_merchant['name']).to eq("David's Store")
    end
  end
end
