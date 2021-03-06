require 'rails_helper'

describe "InvoiceItems Invoices" do
  fixtures :invoice_items
  fixtures :invoices

  context "#Show" do
    it 'returns JSON data on an invoice items invoice matching id params' do
      get '/api/v1/invoice_items/1/invoice'

      invoice = JSON.parse(response.body)

      expect(invoice.class).to eq(Hash)
      expect(response).to be_success
      expect(invoice['id']).to eq(1)
      expect(invoice['customer_id']).to eq(1)
      expect(invoice['merchant_id']).to eq(1)
      expect(invoice['status']).to eq('shipped')
    end
  end
end
