require 'rails_helper'

describe "Customers" do
  fixtures :customers

  it 'returns JSON data on all customers' do
    get '/api/v1/customers'

    customers = JSON.parse(response.body)
    customer = customers.first

    expect(response).to be_success
    expect(customers.length).to eq(3)
    expect(customer['id']).to eq(1)
    expect(customer['first_name']).to eq('Joey')
    expect(customer['last_name']).to eq('Ondricka')
  end

  it 'returns JSON data on a specific customer' do
    get '/api/v1/customers/2'

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer['id']).to eq(2)
    expect(customer['first_name']).to eq('Cecelia')
    expect(customer['last_name']).to eq('Osinski')
  end
end
