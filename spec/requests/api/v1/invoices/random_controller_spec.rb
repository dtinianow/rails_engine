require 'rails_helper'

describe "Invoices Random" do
  fixtures :invoices

  context '#Show' do

    it 'returns JSON data on random invoices' do
      get '/api/v1/invoices/random'

      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice.class).to eq(Hash)
      expect(invoice).to have_key('id')
      expect(invoice).to have_key('customer_id')
      expect(invoice).to have_key('merchant_id')
      expect(invoice).to have_key('status')
    end
  end
end
