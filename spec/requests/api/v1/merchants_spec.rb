require 'rails_helper'

describe "Merchants" do
  fixtures :merchants

  it 'returns JSON data on all merchants' do
    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)
    merchant = merchants.first

    expect(response).to be_success
    expect(merchants.length).to eq(2)
    expect(merchant['id']).to eq(1)
    expect(merchant['name']).to eq("David's Store")
  end

  it 'returns JSON data on a specific merchant' do
    get '/api/v1/merchants/2'

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant['id']).to eq(2)
    expect(merchant['name']).to eq("Matt's Store")
  end
end
