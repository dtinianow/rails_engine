class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json

  def show
    random_id = rand(Customer.count)
    random_customer = Customer.find(random_id)
    respond_with random_customer
  end
end
