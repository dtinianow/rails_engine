class Api::V1::Customers::MerchantsController < ApplicationController
  respond_to :json

  def show
    customer = Customer.find(params[:id])
    respond_with customer.favorite_merchant
  end
end
