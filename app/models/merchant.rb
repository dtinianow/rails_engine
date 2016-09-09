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
    joins(invoices: [:invoice_items,:transactions]).
    where(
      invoices:     {created_at: date},
      transactions: {result: 'success'}
    ).
    sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def single_merchant_revenue
    self.
    invoices.
    joins(:invoice_items, :transactions).
    where(transactions: {result:'success'}).
    sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def single_merchant_revenue_by_date(date)
    self.
    invoices.
    joins(:invoice_items, :transactions).
    where(
      invoices:     {created_at: date},
      transactions: {result: 'success'}
    ).
    sum('invoice_items.quantity*invoice_items.unit_price')
  end

  def favorite_customer
    self.
    customers.
    joins(invoices: :transactions).
    where(transactions: {result: 'success'}).
    group(:id).
    order('count(invoices.customer_id) DESC').
    first
  end

  def customers_with_pending_invoices
    self.
    customers.
    joins(:invoices).
    joins('INNER JOIN transactions ON transactions.invoice_id=invoices.id').
    where(transactions: {result: 'failed'}).
    distinct
  end
end
