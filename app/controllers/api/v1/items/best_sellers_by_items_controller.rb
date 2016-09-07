class Api::V1::Items::BestSellersByItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.ranked_by_items_sold(params[:quantity])
  end
end
