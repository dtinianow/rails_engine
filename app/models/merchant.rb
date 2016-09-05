class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

  def self.ranked_by_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions]).
      where(transactions: {result:'success'}).
      group(:id).
      order('sum(invoice_items.quantity*invoice_items.unit_price) DESC').
      take(quantity)
  end
end
