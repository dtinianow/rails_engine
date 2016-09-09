require 'rails_helper'

describe "Merchants favorite customer" do
  fixtures :merchants
  fixtures :customers
  fixtures :invoices
  fixtures :invoice_items
  fixtures :transactions

  context "#Show" do

    it 'returns JSON data on all merchants favorite customer matching id params' do
      get '/api/v1/merchants/1/favorite_customer'

      favorite_customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(favorite_customer.class).to eq(Hash)
      expect(favorite_customer['id']).to eq(1)
      expect(favorite_customer['first_name']).to eq('Joey')
      expect(favorite_customer['last_name']).to eq('Ondricka')
    end
  end
end
