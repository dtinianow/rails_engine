class ChangeColumnTransactions < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    change_column :transactions, :credit_card_number, :citext
  end
end
