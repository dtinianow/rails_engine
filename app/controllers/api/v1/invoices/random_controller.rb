class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json

  def show
    random_offset = rand(Invoice.count)
    random_invoice = Invoice.offset(random_offset).first
    respond_with random_invoice
  end
end
