class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.favorite_merchants(customer_id)
    find(customer_id).
    merchants.
    joins(invoices: :transactions).
    where(transactions: {result: 'success'}).
    group(:id).
    order('count(invoices.merchant_id) DESC').
    first
  end
end
