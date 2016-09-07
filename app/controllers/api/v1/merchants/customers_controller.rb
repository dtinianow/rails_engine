class Api::V1::Merchants::CustomersController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.favorite_customer(params[:id])
  end
end
