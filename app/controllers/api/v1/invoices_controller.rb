class Api::V1::InvoicesController < ApplicationController

  def index
    render json: Invoice.all
  end

  def find
    render json: Invoice.find_by(invoice_params)
  end

  def find_all
    render json: Invoice.where(invoice_params)
  end

  def show
    render json: Invoice.find(params[:id])
  end

  def random
    random_id = rand(Invoice.count)
    random_invoice = Invoice.find(random_id)
    render json: random_invoice
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
