class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json

  def show
    random_offset = rand(InvoiceItem.count)
    random_invoice_item = InvoiceItem.offset(random_offset).first
    respond_with random_invoice_item
  end
end
