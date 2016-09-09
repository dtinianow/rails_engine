require 'rails_helper'

describe "Invoices Customers" do
  fixtures :invoices
  fixtures :customers

  context "#Show" do
    it 'returns JSON data on a customer belonging to an invoice' do
      get '/api/v1/invoices/1/customer'

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer.class).to eq(Hash)
      expect(customer['id']).to eq(1)
      expect(customer['first_name']).to eq("Joey")
      expect(customer['last_name']).to eq("Ondricka")
    end
  end
end
