class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json
  
  def show
    random_id = rand(Merchant.count)
    random_merchant = Merchant.find(random_id)
    respond_with random_merchant
  end
end
