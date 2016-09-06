class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json

  def show
    random_id = rand(InvoiceItem.count)
    random_invoice_item = InvoiceItem.find(random_id)
    respond_with random_invoice_item
  end
end
