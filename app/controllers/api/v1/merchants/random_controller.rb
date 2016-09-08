class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json

  def show
    random_offset = rand(Merchant.count)
    random_merchant = Merchant.offset(random_offset).first
    respond_with random_merchant
  end
end
