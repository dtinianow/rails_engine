class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find(params[:id])
  end

  def random
    random_id = rand(Merchant.count)
    random_merchant = Merchant.find(random_id)
    respond_with random_merchant
  end

  def most_revenue
    respond_with Merchant.ranked_by_revenue(params[:quantity])
  end

  def most_items
    respond_with Merchant.ranked_by_items_sold(params[:quantity])
  end

  def revenues_per_date
    respond_with Merchant.revenue_by_date(params[:date])
  end

  def revenue
    if params[:date]
      respond_with Merchant.single_merchant_revenue_by_date(params[:id], params[:date])
    else
      respond_with Merchant.single_merchant_revenue(params[:id])
    end
  end
end
