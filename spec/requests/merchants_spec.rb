require 'rails_helper'

describe "Merchants" do
  fixtures :merchants

  it 'returns JSON data on all merchants' do
    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)
    merchant = merchant.first

    expect(response).to be_success
    expect(customers.length).to eq(2)
    expect(customer['id']).to eq(1)
    expect(customer['first_name']).to eq('David')
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
