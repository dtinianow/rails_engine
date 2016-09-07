class Api::V1::Items::BestSellersByRevenueController < ApplicationController
  respond_to :json

  def index
    respond_with Item.ranked_by_revenue(params[:quantity])
  end
end
