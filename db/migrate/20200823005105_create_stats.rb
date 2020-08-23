class CreateStats < ActiveRecord::Migration[6.0]
  def change
    create_table :stats do |t|
      t.date :transaction_date
      t.time :transaction_time
      t.float :transaction_exclusive
      t.float :transaction_tax
      t.integer :transaction_quantity
      t.float :transaction_discount
      t.float :rrp
      t.float :last_buy_price
      t.text :description
      t.text :category
      t.timestamps
    end
  end
end
