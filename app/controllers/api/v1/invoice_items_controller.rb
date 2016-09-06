class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def random
    random_id = rand(InvoiceItem.count)
    random_item = InvoiceItem.find(random_id)
    respond_with random_item
  end
end
