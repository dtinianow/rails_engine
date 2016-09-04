require 'csv'

namespace :import_csv_files do
  task customers: [:environment] do

    file = "data/customers.csv"

    CSV.foreach(file, headers: true) do |row|
      Customer.create(row.to_h)
    end
  end

  task merchants: [:environment] do

    file = "data/merchants.csv"

    CSV.foreach(file, headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  task items: [:environment] do

    file = "data/items.csv"

    CSV.foreach(file, headers: true) do |row|
      Item.create(row.to_h)
    end
  end

  task invoices: [:environment] do

    file = "data/invoices.csv"

    CSV.foreach(file, headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  # task :invoice_items => [:environment] do
  #
  #   file = "data/invoice_items.csv"
  #
  #   CSV.foreach(file, :headers => true) do |row|
  #     InvoiceItem.create({
  #       id: row[0],
  #       item_id: row[1],
  #       invoice_id: row[2],
  #       quantity: row[3],
  #       unit_price: row[4],
  #       :created_at => row[5],
  #       :updated_at => row[6]
  #     })
  #   end
  # end


  #
  #
  #
  # task :transactions => [:environment] do
  #
  #   file = "data/transactions.csv"
  #
  #   CSV.foreach(files, :headers => true) do |row|
  #     Transaction.create {
  #       :name => row[1],
  #       :league => row[2],
  #       :some_other_data => row[4]
  #     }
  #   end
  # end
end
