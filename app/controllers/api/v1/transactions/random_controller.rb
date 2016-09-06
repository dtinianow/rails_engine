class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json

  def show
    random_id = rand(Transaction.count)
    random_transaction = Transaction.find(random_id)
    respond_with random_transaction
  end
end
