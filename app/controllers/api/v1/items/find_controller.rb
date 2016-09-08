class Api::V1::Items::FindController < ApplicationController
  include Utils
  respond_to :json

  def index
    # params[:unit_price] = convert_to_cents(params[:unit_price]) if params[:unit_price]
    respond_with Item.where(item_params)
  end

  def show
    params[:unit_price] = convert_to_cents(params[:unit_price]) if params[:unit_price]
    respond_with Item.find_by(item_params)
  end

private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
