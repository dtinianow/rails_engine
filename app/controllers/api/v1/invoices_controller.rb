class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def random
    random_id = rand(Invoice.count)
    random_invoice = Invoice.find(random_id)
    respond_with random_invoice
  end
end
