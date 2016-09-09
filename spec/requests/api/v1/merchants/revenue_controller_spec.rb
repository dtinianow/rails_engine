require 'rails_helper'

describe "Merchants Revenue" do
  fixtures :merchants
  fixtures :invoices
  fixtures :transactions
  fixtures :invoice_items

  context "#Index" do

    it 'returns JSON data on total revenue of all merchants on specific date' do
      get '/api/v1/merchants/revenue?date=2012-03-25T09:54:09.000Z'

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue.class).to eq(Hash)
      expect(revenue).to have_key('total_revenue')
      expect(revenue['total_revenue']).to eq('2500.25')
    end
  end

  context "#Show" do

    it 'returns JSON data on total revenue of a merchant' do
      get '/api/v1/merchants/1/revenue'

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue.class).to eq(Hash)
      expect(revenue).to have_key('revenue')
      expect(revenue['revenue']).to eq('2500.25')
    end

    it 'returns JSON data on total revenue of a merchant on a specific date' do
      get '/api/v1/merchants/1/revenue?date=2012-03-25T09:54:09.000Z'

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue.class).to eq(Hash)
      expect(revenue).to have_key('revenue')
      expect(revenue['revenue']).to eq('2500.25')
    end
  end
end
