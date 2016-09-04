class CreateTransaction < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.integer :credit_card_number
      t.date :credit_card_expiration_date
      t.citext :result
      t.timestamps null: false
    end
  end
end
