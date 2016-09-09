require 'rails_helper'

describe "Customers Random" do
  fixtures :customers

  context '#Show' do
    it 'returns JSON data on random customer' do
      get '/api/v1/customers/random'

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer.class).to eq(Hash)
      expect(customer).to have_key('id')
      expect(customer).to have_key('first_name')
      expect(customer).to have_key('last_name')
    end
  end
end
