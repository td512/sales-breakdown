class Stat < ApplicationRecord
  validates_presence_of :transaction_date
  validates_presence_of :transaction_time
  validates_presence_of :transaction_exclusive
  validates_presence_of :transaction_tax
  validates_presence_of :transaction_quantity
  validates_presence_of :transaction_discount
  validates_presence_of :description
  validates_presence_of :last_buy_price
end
