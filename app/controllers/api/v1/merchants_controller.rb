class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def most_revenue
    respond_with Merchant.ranked_by_revenue(params[:quantity])
  end

  def most_items
    respond_with Merchant.ranked_by_items_sold(params[:quantity])
  end
end
