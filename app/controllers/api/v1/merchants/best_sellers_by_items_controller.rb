class Api::V1::Merchants::BestSellersByItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.ranked_by_items_sold(params[:quantity])
  end
end
