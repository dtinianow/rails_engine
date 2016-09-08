require 'rails_helper'

describe "Transactions Find" do
  fixtures :transactions

  context "#Index" do

    it 'returns JSON data on all transactions matching id params' do
      get '/api/v1/transactions/find_all?id=1'

      transactions = JSON.parse(response.body)
      transaction = transactions.first

      expect(response).to be_success
      expect(transactions.length).to eq(1)
      expect(transactions.class).to eq(Array)

      expect(transaction.class).to eq(Hash)
      expect(transaction['id']).to eq(1)
      expect(transaction['invoice_id']).to eq(1)
      expect(transaction['credit_card_number']).to eq('4654405418249632')
      expect(transaction['result']).to eq("success")
    end

    it 'returns JSON data on all transactions matching invoice_id params' do
      get '/api/v1/transactions/find_all?invoice_id=1'

      transactions = JSON.parse(response.body)
      transaction = transactions.first

      expect(response).to be_success
      expect(transactions.length).to eq(1)
      expect(transactions.class).to eq(Array)

      expect(transaction.class).to eq(Hash)
      expect(transaction['id']).to eq(1)
      expect(transaction['invoice_id']).to eq(1)
      expect(transaction['credit_card_number']).to eq('4654405418249632')
      expect(transaction['result']).to eq("success")
    end

    it 'returns JSON data on all transactions matching credit card number params' do
      get '/api/v1/transactions/find_all?credit_card_number=4654405418249632'

      transactions = JSON.parse(response.body)
      transaction = transactions.first

      expect(response).to be_success
      expect(transactions.length).to eq(1)
      expect(transactions.class).to eq(Array)

      expect(transaction.class).to eq(Hash)
      expect(transaction['id']).to eq(1)
      expect(transaction['invoice_id']).to eq(1)
      expect(transaction['credit_card_number']).to eq('4654405418249632')
      expect(transaction['result']).to eq("success")
    end

    it 'returns JSON data on all transactions matching result params' do
      get '/api/v1/transactions/find_all?result=success'

      transactions = JSON.parse(response.body)
      transaction = transactions.first

      expect(response).to be_success
      expect(transactions.length).to eq(1)
      expect(transactions.class).to eq(Array)

      expect(transaction.class).to eq(Hash)
      expect(transaction['id']).to eq(1)
      expect(transaction['invoice_id']).to eq(1)
      expect(transaction['credit_card_number']).to eq('4654405418249632')
      expect(transaction['result']).to eq("success")
    end
  end

  context "#Show" do

    it 'returns JSON data on a specific transaction matching id params' do
      get '/api/v1/transactions/find?id=2'

      transaction = JSON.parse(response.body)

      expect(transaction.class).to eq(Hash)
      expect(response).to be_success
      expect(transaction['id']).to eq(2)
      expect(transaction['invoice_id']).to eq(2)
      expect(transaction['credit_card_number']).to eq('4580251236515201')
      expect(transaction['result']).to eq("failed")
    end

    it 'returns JSON data on a specific transaction matching item_id params' do
      get '/api/v1/transactions/find?invoice_id=2'

      transaction = JSON.parse(response.body)

      expect(transaction.class).to eq(Hash)
      expect(response).to be_success
      expect(transaction['id']).to eq(2)
      expect(transaction['invoice_id']).to eq(2)
      expect(transaction['credit_card_number']).to eq('4580251236515201')
      expect(transaction['result']).to eq("failed")
    end

    it 'returns JSON data on a specific transaction matching credit card number params' do
      get '/api/v1/transactions/find?credit_card_number=4580251236515201'

      transaction = JSON.parse(response.body)

      expect(transaction.class).to eq(Hash)
      expect(response).to be_success
      expect(transaction['id']).to eq(2)
      expect(transaction['invoice_id']).to eq(2)
      expect(transaction['credit_card_number']).to eq('4580251236515201')
      expect(transaction['result']).to eq("failed")
    end

    it 'returns JSON data on a specific transaction matching result params' do
      get '/api/v1/transactions/find?result=failed'

      transaction = JSON.parse(response.body)

      expect(transaction.class).to eq(Hash)
      expect(response).to be_success
      expect(transaction['id']).to eq(2)
      expect(transaction['invoice_id']).to eq(2)
      expect(transaction['credit_card_number']).to eq('4580251236515201')
      expect(transaction['result']).to eq("failed")
    end
  end
end
