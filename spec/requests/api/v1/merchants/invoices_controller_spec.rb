require 'rails_helper'

describe "Merchant's invoices" do
  fixtures :merchants
  fixtures :invoices

  context "#Index" do
    it 'returns JSON data on all merchant invoices matching id params' do
      get '/api/v1/merchants/1/invoices'

      invoices = JSON.parse(response.body)
      invoice = invoices.first

      expect(response).to be_success
      expect(invoices.length).to eq(1)
      expect(invoices.class).to eq(Array)
      expect(invoice.class).to eq(Hash)
      expect(invoice['id']).to eq(1)
      expect(invoice['customer_id']).to eq(1)
      expect(invoice['merchant_id']).to eq(1)
      expect(invoice['status']).to eq("shipped")
    end
  end
end
