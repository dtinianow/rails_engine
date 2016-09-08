class Api::V1::Items::RandomController < ApplicationController
  respond_to :json

  def show
    random_offset = rand(Item.count)
    random_item = Item.offset(random_offset).first
    respond_with random_item  end
end
