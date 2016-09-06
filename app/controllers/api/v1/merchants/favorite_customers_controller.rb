class Api::V1::Merchants::FavoriteCustomersController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.favorite_customer(params[:id])
  end
end
