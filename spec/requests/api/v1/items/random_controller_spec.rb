require 'rails_helper'

describe "Items Random" do
  fixtures :items

  context '#Show' do
    it 'returns JSON data on random item' do
      get '/api/v1/items/random'

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item.class).to eq(Hash)
      expect(item).to have_key('id')
      expect(item).to have_key('name')
      expect(item).to have_key('description')
      expect(item).to have_key('unit_price')
      expect(item).to have_key('merchant_id')
    end
  end
end
