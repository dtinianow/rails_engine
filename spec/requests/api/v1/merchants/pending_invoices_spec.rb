require 'rails_helper'

describe "Merchants Pending Invoices" do
  fixtures :customers
  fixtures :merchants
  fixtures :invoices
  fixtures :transactions

  context "#Index" do
    it 'returns JSON data on customers with pending invoices' do
      get '/api/v1/merchants/2/customers_with_pending_invoices'

      customers = JSON.parse(response.body)
      customer  = customers.first

      expect(response).to be_success
      expect(customers.class).to eq(Array)
      expect(customer.class).to eq(Hash)
      expect(customer['id']).to eq(2)
      expect(customer['first_name']).to eq('Cecelia')
      expect(customer['last_name']).to eq('Osinski')
    end
  end
end
