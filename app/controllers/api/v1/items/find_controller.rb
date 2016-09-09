class Api::V1::Items::FindController < ApplicationController
  include Utils
  respond_to :json
  before_action :convert_unit_price_to_cents

  def index
    respond_with Item.where(item_params)
  end

  def show
    respond_with Item.find_by(item_params)
  end

private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
