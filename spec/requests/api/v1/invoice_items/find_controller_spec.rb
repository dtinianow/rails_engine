require 'rails_helper'

describe "Invoice Items Find" do
  fixtures :invoice_items

  context "#Index" do
    it 'returns JSON data on all invoice items matching id params' do
      get '/api/v1/invoice_items/find_all?id=1'

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_success
      expect(invoice_items.length).to eq(1)
      expect(invoice_items.class).to eq(Array)
      expect(invoice_item.class).to eq(Hash)
      expect(invoice_item['id']).to eq(1)
      expect(invoice_item['item_id']).to eq(1)
      expect(invoice_item['invoice_id']).to eq(1)
      expect(invoice_item['unit_price']).to eq("500.05")
    end

    it 'returns JSON data on all invoice items matching item_id params' do
      get '/api/v1/invoice_items/find_all?item_id=1'

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_success
      expect(invoice_items.length).to eq(1)
      expect(invoice_items.class).to eq(Array)
      expect(invoice_item.class).to eq(Hash)
      expect(invoice_item['id']).to eq(1)
      expect(invoice_item['item_id']).to eq(1)
      expect(invoice_item['invoice_id']).to eq(1)
      expect(invoice_item['unit_price']).to eq("500.05")
    end

    it 'returns JSON data on all invoice items matching invoice_id params' do
      get '/api/v1/invoice_items/find_all?invoice_id=1'

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_success
      expect(invoice_items.length).to eq(1)
      expect(invoice_items.class).to eq(Array)
      expect(invoice_item.class).to eq(Hash)
      expect(invoice_item['id']).to eq(1)
      expect(invoice_item['item_id']).to eq(1)
      expect(invoice_item['invoice_id']).to eq(1)
      expect(invoice_item['unit_price']).to eq("500.05")
    end

    it 'returns JSON data on all invoice items matching quantity params' do
      get '/api/v1/invoice_items/find_all?quantity=5'

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_success
      expect(invoice_items.length).to eq(1)
      expect(invoice_items.class).to eq(Array)
      expect(invoice_item.class).to eq(Hash)
      expect(invoice_item['id']).to eq(1)
      expect(invoice_item['item_id']).to eq(1)
      expect(invoice_item['invoice_id']).to eq(1)
      expect(invoice_item['unit_price']).to eq("500.05")
    end

    it 'returns JSON data on all invoice items matching unit price params' do
      get '/api/v1/invoice_items/find_all?unit_price=500.05'

      invoice_items = JSON.parse(response.body)
      invoice_item = invoice_items.first

      expect(response).to be_success
      expect(invoice_items.length).to eq(1)
      expect(invoice_items.class).to eq(Array)
      expect(invoice_item.class).to eq(Hash)
      expect(invoice_item['id']).to eq(1)
      expect(invoice_item['item_id']).to eq(1)
      expect(invoice_item['invoice_id']).to eq(1)
      expect(invoice_item['unit_price']).to eq("500.05")
    end
  end

  context "#Show" do
    it 'returns JSON data on a specific invoice_item matching item_id params' do
      get '/api/v1/invoice_items/find?item_id=2'

      invoice_item = JSON.parse(response.body)

      expect(invoice_item.class).to eq(Hash)
      expect(response).to be_success
      expect(invoice_item['id']).to eq(2)
      expect(invoice_item['item_id']).to eq(2)
      expect(invoice_item['invoice_id']).to eq(2)
      expect(invoice_item['quantity']).to eq(10)
      expect(invoice_item['unit_price']).to eq("2000.20")
    end

    it 'returns JSON data on a specific invoice_item matching invoice_id params' do
      get '/api/v1/invoice_items/find?invoice_id=2'

      invoice_item = JSON.parse(response.body)

      expect(invoice_item.class).to eq(Hash)
      expect(response).to be_success
      expect(invoice_item['id']).to eq(2)
      expect(invoice_item['item_id']).to eq(2)
      expect(invoice_item['invoice_id']).to eq(2)
      expect(invoice_item['quantity']).to eq(10)
      expect(invoice_item['unit_price']).to eq("2000.20")
    end

    it 'returns JSON data on a specific invoice_item matching quantity params' do
      get '/api/v1/invoice_items/find?quantity=10'

      invoice_item = JSON.parse(response.body)

      expect(invoice_item.class).to eq(Hash)
      expect(response).to be_success
      expect(invoice_item['id']).to eq(2)
      expect(invoice_item['item_id']).to eq(2)
      expect(invoice_item['invoice_id']).to eq(2)
      expect(invoice_item['quantity']).to eq(10)
      expect(invoice_item['unit_price']).to eq("2000.20")
    end

    it 'returns JSON data on a specific invoice_item matching unit price params' do
      get '/api/v1/invoice_items/find?unit_price=2000.20'

      invoice_item = JSON.parse(response.body)

      expect(invoice_item.class).to eq(Hash)
      expect(response).to be_success
      expect(invoice_item['id']).to eq(2)
      expect(invoice_item['item_id']).to eq(2)
      expect(invoice_item['invoice_id']).to eq(2)
      expect(invoice_item['quantity']).to eq(10)
      expect(invoice_item['unit_price']).to eq("2000.20")
    end
  end
end
