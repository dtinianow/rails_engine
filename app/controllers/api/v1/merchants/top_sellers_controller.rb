class Api::V1::Merchants::TopSellersController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.ranked_by_revenue(params[:quantity])
  end
end
