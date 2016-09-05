class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def find
    render json: Item.find_by(item_params)
  end

  def find_all
    render json: Item.where(item_params)
  end

  def show
    render json: Item.find(params[:id])
  end

  def random
    random_id = rand(Item.count)
    random_item = Item.find(random_id)
    render json: random_item
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
