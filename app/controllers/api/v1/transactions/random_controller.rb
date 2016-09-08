class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json

  def show
    random_offset = rand(Transaction.count)
    random_transaction = Transaction.offset(random_offset).first
    respond_with random_transaction
  end
end
