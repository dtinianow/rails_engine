require 'rails_helper'

describe "Items" do
  fixtures :items

  it 'returns JSON data on all items' do
    get '/api/v1/items'

    items = JSON.parse(response.body)
    item = items.first

    expect(response).to be_success
    expect(items.length).to eq(2)
    expect(item['id']).to eq(1)
    expect(item['name']).to eq("Golf Club")
    expect(item['description']).to eq("Intended to strike golf balls.")
    expect(item['unit_price']).to eq(75107)
    expect(item['merchant_id']).to eq(1)
  end

  it 'returns JSON data on a specific item' do
    get '/api/v1/items/2'

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item['id']).to eq(2)
    expect(item['name']).to eq("Golf Ball")
    expect(item['description']).to eq("Intended to be striken by a golf club.")
    expect(item['unit_price']).to eq(67076)
    expect(item['merchant_id']).to eq(1)
  end
end
