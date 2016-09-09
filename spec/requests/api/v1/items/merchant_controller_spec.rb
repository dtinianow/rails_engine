require 'rails_helper'

describe "Item's Merchant Show" do
  fixtures :items
  fixtures :merchants

  context "#Show" do
    it "returns JSON data on a specific item's merchants matching merchant_id params" do
      get '/api/v1/items/1/merchant'

      merchant = JSON.parse(response.body)

      expect(merchant.class).to eq(Hash)
      expect(response).to be_success
      expect(merchant['id']).to eq(1)
      expect(merchant['name']).to eq("David's Store")
    end
  end
end
