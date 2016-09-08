require 'rails_helper'

describe "Items Find" do
  fixtures :items

  context "#Index" do

    it 'returns JSON data on all items matching id params' do
      get '/api/v1/items/find_all?id=1'

      items = JSON.parse(response.body)
      item = items.first

      expect(response).to be_success
      expect(items.length).to eq(1)
      expect(items.class).to eq(Array)

      expect(item.class).to eq(Hash)
      expect(item['id']).to eq(1)
      expect(item['name']).to eq('Golf Club')
      expect(item['description']).to eq('Intended to strike golf balls.')
      expect(item['unit_price']).to eq("100.01")
      expect(item['merchant_id']).to eq(1)
    end

    it 'returns JSON data on all items matching name params' do
      get '/api/v1/items/find_all?name=Golf Club'

      items = JSON.parse(response.body)
      item = items.first

      expect(response).to be_success
      expect(items.length).to eq(1)
      expect(items.class).to eq(Array)

      expect(item.class).to eq(Hash)
      expect(item['id']).to eq(1)
      expect(item['name']).to eq('Golf Club')
      expect(item['description']).to eq('Intended to strike golf balls.')
      expect(item['unit_price']).to eq("100.01")
      expect(item['merchant_id']).to eq(1)
    end

    it 'returns JSON data on all items matching description params' do
      get '/api/v1/items/find_all?description=Intended to strike golf balls.'

      items = JSON.parse(response.body)
      item = items.first

      expect(response).to be_success
      expect(items.length).to eq(1)
      expect(items.class).to eq(Array)

      expect(item.class).to eq(Hash)
      expect(item['id']).to eq(1)
      expect(item['name']).to eq('Golf Club')
      expect(item['description']).to eq('Intended to strike golf balls.')
      expect(item['unit_price']).to eq("100.01")
      expect(item['merchant_id']).to eq(1)
    end

    it 'returns json data on all items matching unit price params' do
      get '/api/v1/items/find_all?unit_price=100.01'

      items = JSON.parse(response.body)
      item = items.first

      expect(response).to be_success
      expect(items.length).to eq(1)
      expect(items.class).to eq(Array)

      expect(item.class).to eq(Hash)
      expect(item['id']).to eq(1)
      expect(item['name']).to eq('Golf Club')
      expect(item['description']).to eq('Intended to strike golf balls.')
      expect(item['unit_price']).to eq("100.01")
      expect(item['merchant_id']).to eq(1)
    end

    it 'returns json data on all items matching merchant params' do
      get '/api/v1/items/find_all?merchant_id=1'

      items = JSON.parse(response.body)
      item = items.first

      expect(response).to be_success
      expect(items.length).to eq(1)
      expect(items.class).to eq(Array)

      expect(item.class).to eq(Hash)
      expect(item['id']).to eq(1)
      expect(item['name']).to eq('Golf Club')
      expect(item['description']).to eq('Intended to strike golf balls.')
      expect(item['unit_price']).to eq("100.01")
      expect(item['merchant_id']).to eq(1)
    end
  end

  context "#Show" do

    it 'returns JSON data on a specific item matching id params' do
      get '/api/v1/items/find?id=2'

      item = JSON.parse(response.body)

      expect(item.class).to eq(Hash)
      expect(response).to be_success
      expect(item['id']).to eq(2)
      expect(item['name']).to eq('Golf Ball')
      expect(item['description']).to eq('Intended to be striken by a golf club.')
      expect(item['unit_price']).to eq("200.02")
      expect(item['merchant_id']).to eq(2)
    end

    it 'returns JSON data on a specific item matching name params' do
      get '/api/v1/items/find?name=Golf Ball'

      item = JSON.parse(response.body)

      expect(item.class).to eq(Hash)
      expect(response).to be_success
      expect(item['id']).to eq(2)
      expect(item['name']).to eq('Golf Ball')
      expect(item['description']).to eq('Intended to be striken by a golf club.')
      expect(item['unit_price']).to eq("200.02")
      expect(item['merchant_id']).to eq(2)
    end

    it 'returns JSON data on a specific item matching description params' do
      get '/api/v1/items/find?description=Intended to be striken by a golf club.'

      item = JSON.parse(response.body)

      expect(item.class).to eq(Hash)
      expect(response).to be_success
      expect(item['id']).to eq(2)
      expect(item['name']).to eq('Golf Ball')
      expect(item['description']).to eq('Intended to be striken by a golf club.')
      expect(item['unit_price']).to eq("200.02")
      expect(item['merchant_id']).to eq(2)
    end

    it 'returns JSON data on a specific item matching unit price params' do
      get '/api/v1/items/find?unit_price=200.02'

      item = JSON.parse(response.body)

      expect(item.class).to eq(Hash)
      expect(response).to be_success
      expect(item['id']).to eq(2)
      expect(item['name']).to eq('Golf Ball')
      expect(item['description']).to eq('Intended to be striken by a golf club.')
      expect(item['unit_price']).to eq("200.02")
      expect(item['merchant_id']).to eq(2)
    end

    it 'returns JSON data on a specific item matching merchant id params' do
      get '/api/v1/items/find?merchant_id=2'

      item = JSON.parse(response.body)

      expect(item.class).to eq(Hash)
      expect(response).to be_success
      expect(item['id']).to eq(2)
      expect(item['name']).to eq('Golf Ball')
      expect(item['description']).to eq('Intended to be striken by a golf club.')
      expect(item['unit_price']).to eq("200.02")
      expect(item['merchant_id']).to eq(2)
    end
  end
end
