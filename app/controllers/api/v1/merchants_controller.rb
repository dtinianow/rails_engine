class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def find
    respond_with Merchant.find_by(merchant_params)
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def random
    random_id = rand(Merchant.count)
    random_merchant = Merchant.find(random_id)
    respond_with random_merchant
  end

  def most_revenue
    respond_with Merchant.ranked_by_revenue(params[:quantity])
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
