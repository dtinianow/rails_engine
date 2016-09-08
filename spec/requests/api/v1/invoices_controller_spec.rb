require 'rails_helper'

describe "Invoices" do
  fixtures :invoices

  it 'returns JSON data on all invoices' do
    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)
    invoice = invoices.first

    expect(response).to be_success
    expect(invoices.length).to eq(2)
    expect(invoices.class).to eq(Array)

    expect(invoice.class).to eq(Hash)
    expect(invoice['id']).to eq(1)
    expect(invoice['customer_id']).to eq(1)
    expect(invoice['merchant_id']).to eq(1)
    expect(invoice['status']).to eq("shipped")
  end

  it 'returns JSON data on a specific invoice' do
    get '/api/v1/invoices/2'

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice.class).to eq(Hash)
    expect(invoice['id']).to eq(2)
    expect(invoice['customer_id']).to eq(2)
    expect(invoice['merchant_id']).to eq(2)
    expect(invoice['status']).to eq("shipped")
  end
end
