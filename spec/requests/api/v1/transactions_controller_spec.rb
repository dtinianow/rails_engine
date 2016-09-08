require 'rails_helper'

describe "Transactions" do
  fixtures :transactions

  it 'returns JSON data on all transactions' do
    get '/api/v1/transactions'

    transactions = JSON.parse(response.body)
    transaction = transactions.first

    expect(response).to be_success
    expect(transactions.length).to eq(2)
    expect(transaction['id']).to eq(1)
    expect(transaction['invoice_id']).to eq(1)
    expect(transaction['result']).to eq("success")
  end

  it 'returns JSON data on a specific transaction' do
    get '/api/v1/transactions/2'

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction['id']).to eq(2)
    expect(transaction['invoice_id']).to eq(2)
    expect(transaction['result']).to eq("failed")
  end
end
