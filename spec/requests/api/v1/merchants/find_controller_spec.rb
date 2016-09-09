require 'rails_helper'

describe "Merchants Find" do
  fixtures :merchants

  context "#Index" do
    it 'returns JSON data on all merchants matching id params' do
      get '/api/v1/merchants/find_all?id=1'

      merchants = JSON.parse(response.body)
      merchant = merchants.first

      expect(response).to be_success
      expect(merchants.length).to eq(1)
      expect(merchants.class).to eq(Array)
      expect(merchant.class).to eq(Hash)
      expect(merchant['id']).to eq(1)
      expect(merchant['name']).to eq("David's Store")
    end

    it 'returns JSON data on all merchants matching name params' do
      get '/api/v1/merchants/find_all?name=David\'s Store'

      merchants = JSON.parse(response.body)
      merchant = merchants.first

      expect(response).to be_success
      expect(merchants.length).to eq(1)
      expect(merchants.class).to eq(Array)
      expect(merchant.class).to eq(Hash)
      expect(merchant['id']).to eq(1)
      expect(merchant['name']).to eq("David's Store")
    end
  end

  context "#Show" do
    it 'returns JSON data on a specific merchant matching id params' do
      get '/api/v1/merchants/find?id=2'

      merchant = JSON.parse(response.body)

      expect(merchant.class).to eq(Hash)
      expect(response).to be_success
      expect(merchant['id']).to eq(2)
      expect(merchant['name']).to eq("Matt's Store")
    end

    it 'returns JSON data on a specific merchant matching name params' do
      get '/api/v1/merchants/find?name=Matt\'s Store'

      merchant = JSON.parse(response.body)

      expect(merchant.class).to eq(Hash)
      expect(response).to be_success
      expect(merchant['id']).to eq(2)
      expect(merchant['name']).to eq("Matt's Store")
    end
  end
end
