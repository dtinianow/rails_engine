class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def find
    respond_with Invoice.find_by(invoice_params)
  end

  def find_all
    respond_with Invoice.where(invoice_params)
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def random
    random_id = rand(Invoice.count)
    random_invoice = Invoice.find(random_id)
    respond_with random_invoice
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
