class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :convert_unit_price_to_cents

  def convert_unit_price_to_cents
    params[:unit_price] = convert_to_cents(params[:unit_price]) if params[:unit_price]
  end
end
