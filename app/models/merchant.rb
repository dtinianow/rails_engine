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

  def self.ranked_by_items_sold(quantity)
    joins(invoices: [:invoice_items,:transactions]).
    where(transactions: {result:'success'}).
    group(:id).
    order('sum(invoice_items.quantity) DESC').
    take(quantity)
  end

  def self.revenue_by_date(date)
    date = DateTime.parse(date)
    joins(invoices: [:invoice_items,:transactions]).
    where(
      invoices:     {created_at: date.beginning_of_day..date.end_of_day},
      transactions: {result:     'success'}
    ).
    sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def self.single_merchant_revenue(merchant_id)
    find(merchant_id).
    invoices.
    joins(:invoice_items, :transactions).
    where(transactions: {result:'success'}).
    sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def self.single_merchant_revenue_by_date(merchant_id, date)
    date = DateTime.parse(date)
    find(merchant_id).
    invoices.
    joins(:invoice_items, :transactions).
    where(
      invoices:     {created_at: date.beginning_of_day..date.end_of_day},
      transactions: {result:     'success'}
    ).
    sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def self.favorite_customer(merchant_id)
    find(merchant_id).
    customers.
    joins(invoices: :transactions).
    where(transactions: {result: 'success'}).
    group(:id).
    order('count(invoices.customer_id) DESC').
    first
  end
end
