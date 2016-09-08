require 'rails_helper'

describe "Customers Find" do
  fixtures :customers

  context "#Index" do
    it 'returns JSON data on all customers matching first_name params' do
      get '/api/v1/customers/find_all?first_name=Cecelia'

      customers = JSON.parse(response.body)
      customer = customers.first

      expect(response).to be_success
      expect(customers.length).to eq(1)
      expect(customers.class).to eq(Array)
      expect(customer.class).to eq(Hash)
      expect(customer['id']).to eq(2)
      expect(customer['first_name']).to eq('Cecelia')
      expect(customer['last_name']).to eq('Osinski')
    end

    it 'returns JSON data on all customers matching last_name params' do
      get '/api/v1/customers/find_all?last_name=Ondricka'

      customers = JSON.parse(response.body)
      customer = customers.first

      expect(response).to be_success
      expect(customers.length).to eq(1)
      expect(customers.class).to eq(Array)
      expect(customer.class).to eq(Hash)
      expect(customer['id']).to eq(1)
      expect(customer['first_name']).to eq('Joey')
      expect(customer['last_name']).to eq('Ondricka')
    end
  end

  context "#Show" do
    it 'returns JSON data on a specific customer' do
      get '/api/v1/customers/find?first_name=Cecelia'

      customer = JSON.parse(response.body)

      expect(customer.class).to eq(Hash)
      expect(response).to be_success
      expect(customer['id']).to eq(2)
      expect(customer['first_name']).to eq('Cecelia')
      expect(customer['last_name']).to eq('Osinski')
    end

    it 'returns JSON data on a specific customer' do
      get '/api/v1/customers/find?last_name=Ondricka'

      customer = JSON.parse(response.body)

      expect(customer.class).to eq(Hash)
      expect(response).to be_success
      expect(customer['id']).to eq(1)
      expect(customer['first_name']).to eq('Joey')
      expect(customer['last_name']).to eq('Ondricka')
    end
  end
end
