class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.ranked_by_revenue(quantity)
    joins(:invoice_items, invoices: :transactions).
    where(transactions: {result:'success'}).
    group(:id).
    order('sum(invoice_items.quantity*invoice_items.unit_price) DESC').
    take(quantity)
  end

  def self.ranked_by_items_sold(quantity)
    joins(:invoice_items, invoices: :transactions).
    where(transactions: {result:'success'}).
    group(:id).
    order('sum(invoice_items.quantity) DESC').
    take(quantity)
  end
end
