class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json

  def show
    random_offset = rand(Customer.count)
    random_customer = Customer.offset(random_offset).first
    respond_with random_customer
  end
end
