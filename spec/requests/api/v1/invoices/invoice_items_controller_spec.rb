require 'rails_helper'

describe "Invoices Invoice Items" do
  fixtures :invoices
  fixtures :invoice_items

  context "#Show" do
    it 'returns JSON data on all invoice items belonging to an invoice' do
      get '/api/v1/invoices/1/invoice_items'

      invoice_items = JSON.parse(response.body)
      invoice_item  = invoice_items.first

      expect(response).to be_success
      expect(invoice_items.class).to eq(Array)
      expect(invoice_item.class).to eq(Hash)
      expect(invoice_item['id']).to eq(1)
      expect(invoice_item['item_id']).to eq(1)
      expect(invoice_item['invoice_id']).to eq(1)
      expect(invoice_item['quantity']).to eq(5)
      expect(invoice_item['unit_price']).to eq('500.05')
    end
  end
end
