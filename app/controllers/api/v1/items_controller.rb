class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def random
    random_id = rand(Item.count)
    random_item = Item.find(random_id)
    respond_with random_item
  end
end
