class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.find(params[:id])
    respond_with merchant.customers_with_pending_invoices
  end
end
