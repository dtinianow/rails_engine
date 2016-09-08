require 'rails_helper'

describe "Invoices Find" do
  fixtures :invoices

  context '#Index' do
    it 'returns JSON data on all invoices matching customer_id params' do
      get '/api/v1/invoices/find_all?customer_id=1'

      invoices = JSON.parse(response.body)
      invoice = invoices.first

      expect(response).to be_success
      expect(invoices.length).to eq(1)
      expect(invoices.class).to eq(Array)

      expect(invoice.class).to eq(Hash)
      expect(invoice['id']).to eq(1)
      expect(invoice['customer_id']).to eq(1)
      expect(invoice['merchant_id']).to eq(1)
    end

    it 'returns JSON data on all invoices matching merchant_id params' do
      get '/api/v1/invoices/find_all?merchant_id=2'

      invoices = JSON.parse(response.body)
      invoice = invoices.first

      expect(response).to be_success
      expect(invoices.length).to eq(1)
      expect(invoices.class).to eq(Array)

      expect(invoice.class).to eq(Hash)
      expect(invoice['id']).to eq(2)
      expect(invoice['customer_id']).to eq(2)
      expect(invoice['merchant_id']).to eq(2)
    end
  end

  context '#Show' do
    it 'returns JSON data on a specific invoice matching merchant_id' do
      get '/api/v1/invoices/find?merchant_id=2'

      invoice = JSON.parse(response.body)

      expect(invoice.class).to eq(Hash)
      expect(response).to be_success
      expect(invoice['id']).to eq(2)
      expect(invoice['customer_id']).to eq(2)
      expect(invoice['merchant_id']).to eq(2)
    end

    it 'returns JSON data on a specific invoice matching customer_id' do
      get '/api/v1/invoices/find?customer_id=1'

      invoice = JSON.parse(response.body)

      expect(invoice.class).to eq(Hash)
      expect(response).to be_success
      expect(invoice['id']).to eq(1)
      expect(invoice['customer_id']).to eq(1)
      expect(invoice['merchant_id']).to eq(1)
    end
  end
end
