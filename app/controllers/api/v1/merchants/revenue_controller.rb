class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.revenue_by_date(params[:date])
  end

  def show
    if params[:date]
      respond_with Merchant.single_merchant_revenue_by_date(params[:id], params[:date])
    else
      respond_with Merchant.single_merchant_revenue(params[:id])
    end
  end
end
