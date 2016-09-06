class Api::V1::Items::RandomController < ApplicationController
  respond_to :json

  def show
    random_id = rand(Item.count)
    random_item = Item.find(random_id)
    respond_with random_item
  end
end
