require 'rails_helper'

describe "Transactions Random" do
  fixtures :transactions

  context '#Show' do

    it 'returns JSON data on random transaction' do
      get '/api/v1/transactions/random'

      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction.class).to eq(Hash)
      expect(transaction).to have_key('id')
      expect(transaction).to have_key('invoice_id')
      expect(transaction).to have_key('credit_card_number')
      expect(transaction).to have_key('result')
    end
  end
end
