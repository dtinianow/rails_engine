require 'rails_helper'

describe "Customer's Transactions" do
  fixtures :customers
  fixtures :invoices
  fixtures :transactions

  context "#Index" do

    it 'returns JSON data on all customer transactions matching id params' do
      get '/api/v1/customers/1/transactions'

      transactions = JSON.parse(response.body)
      transaction = transactions.first

      expect(response).to be_success
      expect(transactions.length).to eq(1)
      expect(transactions.class).to eq(Array)

      expect(transaction.class).to eq(Hash)
      expect(transaction['id']).to eq(1)
      expect(transaction['invoice_id']).to eq(1)
      expect(transaction['credit_card_number']).to eq("4654405418249632")
      expect(transaction['result']).to eq("success")
    end
  end
end
