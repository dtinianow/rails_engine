require 'rails_helper'

describe "Invoices Merchants" do
  fixtures :invoices
  fixtures :merchants

  context "#Show" do

    it 'returns JSON data on a merchant belonging to an invoice' do
      get '/api/v1/invoices/1/merchant'

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.class).to eq(Hash)
      expect(merchant['id']).to eq(1)
      expect(merchant['name']).to eq("David's Store")
    end
  end
end
