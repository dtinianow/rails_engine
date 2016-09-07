class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.revenue_by_date(params[:date])
  end

  def show
    merchant = Merchant.find(params[:id])
    if params[:date]
      respond_with merchant.single_merchant_revenue_by_date(params[:date])
    else
      respond_with merchant.single_merchant_revenue
    end
  end
end
