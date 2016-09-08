require 'rails_helper'

describe "Merchants Random" do
  fixtures :merchants

  context '#Show' do

    it 'returns JSON data on random merchant' do
      get '/api/v1/merchants/random'

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.class).to eq(Hash)
      expect(merchant).to have_key('id')
      expect(merchant).to have_key('name')
    end
  end
end
