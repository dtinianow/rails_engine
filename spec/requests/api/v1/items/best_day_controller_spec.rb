require 'rails_helper'

describe "Items best day by quantity of item sold" do
  fixtures :items
  fixtures :invoices
  fixtures :transactions

  context "#Show" do

    it 'returns JSON data on date for when specific item sold the most' do
      get '/api/v1/items/1/best_day'

      best_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(best_item.class).to eq(Hash)
      expect(best_item).to have_key('best_day')
      expect(best_item['best_day']).to eq("2012-03-25T09:54:09.000Z")
    end
  end
end
