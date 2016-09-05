class Api::V1::MerchantsController < ApplicationController

  def index
    render json: Merchant.all
  end

  def find
    render json: Merchant.find_by(merchant_params)
  end

  def find_all
    render json: Merchant.where(merchant_params)
  end

  def show
    render json: Merchant.find(params[:id])
  end

  def random
    random_id = rand(Merchant.count)
    random_merchant = Merchant.find(random_id)
    render json: random_merchant
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
