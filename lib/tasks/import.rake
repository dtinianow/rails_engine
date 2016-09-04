require 'csv'

namespace :import_csv_files do
  desc 'Imports customer data'
  task customers: [:environment] do
    file = "data/customers.csv"

    CSV.foreach(file, headers: true) do |row|
      Customer.create(row.to_h)
    end
  end

  desc 'Imports merchant data'
  task merchants: [:environment] do
    file = "data/merchants.csv"

    CSV.foreach(file, headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  desc 'Imports item data'
  task items: [:environment] do
    file = "data/items.csv"

    CSV.foreach(file, headers: true) do |row|
      Item.create(row.to_h)
    end
  end

  desc 'Imports invoice data'
  task invoices: [:environment] do
    file = "data/invoices.csv"

    CSV.foreach(file, headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  desc 'Imports invoice_item data'
  task invoice_items: [:environment] do
    file = "data/invoice_items.csv"

    CSV.foreach(file, headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  desc 'Imports transaction data'
  task transactions: [:environment] do
    file = "data/transactions.csv"

    CSV.foreach(file, headers: true) do |row|
      Transaction.create(row.to_h)
    end
  end

  desc 'Imports all csv data'
  task all: [:environment] do
    Rake::Task["import_csv_files:customers"].execute
    Rake::Task["import_csv_files:merchants"].execute
    Rake::Task["import_csv_files:items"].execute
    Rake::Task["import_csv_files:invoices"].execute
    Rake::Task["import_csv_files:invoice_items"].execute
    Rake::Task["import_csv_files:transactions"].execute
  end
end
