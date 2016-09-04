require 'csv'

# desc "Import csv files from data folder"
namespace :import_csv_files do
  task :customers => [:environment] do

    file = "data/customers.csv"

    CSV.foreach(files, :headers => true) do |row|
      Customer.create {
        :id => row[0],
        :first_name => row[1],
        :last_name => row[2],
        :created_at => row[3]
        :updated_at => row[4]
      }
    end
  end
  #
  # task :invoice_items => [:environment] do
  #
  #   file = "data/invoice_items.csv"
  #
  #   CSV.foreach(files, :headers => true) do |row|
  #     InvoiceItem.create {
  #       :name => row[1],
  #       :league => row[2],
  #       :some_other_data => row[4]
  #     }
  #   end
  # end
  #
  # task :invoices => [:environment] do
  #
  #   file = "data/invoices.csv"
  #
  #   CSV.foreach(files, :headers => true) do |row|
  #     Invoice.create {
  #       :name => row[1],
  #       :league => row[2],
  #       :some_other_data => row[4]
  #     }
  #   end
  # end
  #
  # task :items => [:environment] do
  #
  #   file = "data/items.csv"
  #
  #   CSV.foreach(files, :headers => true) do |row|
  #     Item.create {
  #       :name => row[1],
  #       :league => row[2],
  #       :some_other_data => row[4]
  #     }
  #   end
  # end
  #
  # task :merchants => [:environment] do
  #
  #   file = "data/merchants.csv"
  #
  #   CSV.foreach(files, :headers => true) do |row|
  #     Merchant.create {
  #       :name => row[1],
  #       :league => row[2],
  #       :some_other_data => row[4]
  #     }
  #   end
  # end
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
