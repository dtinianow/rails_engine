class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json

  def show
    random_id = rand(Invoice.count)
    random_invoice = Invoice.find(random_id)
    respond_with random_invoice
  end
end
