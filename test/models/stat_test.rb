require 'test_helper'

class StatTest < ActiveSupport::TestCase
  test "shouldn't save stat without transaction_date" do
    stat = Stat.new(transaction_time: '10:00'.to_time, transaction_exclusive: 99.01, transaction_tax: 0.99,
                    transaction_quantity: 2, transaction_discount: 0, description: "Test case DATE",
                    last_buy_price: 95.01)
    assert_not stat.save
  end

  test "shouldn't save stat without transaction_time" do
    stat = Stat.new(transaction_date: '01/01/1971'.to_date, transaction_exclusive: 99.01, transaction_tax: 0.99,
                    transaction_quantity: 2, transaction_discount: 0, description: "Test case TIME",
                    last_buy_price: 95.01)
    assert_not stat.save
  end

  test "shouldn't save stat without transaction_exclusive" do
    stat = Stat.new(transaction_date: '01/01/1971'.to_date, transaction_time: '10:00'.to_time,
                    transaction_tax: 0.99, transaction_quantity: 2, transaction_discount: 0,
                    description: "Test case EXCLUSIVE", last_buy_price: 95.01)
    assert_not stat.save
  end

  test "shouldn't save stat without transaction_tax" do
    stat = Stat.new(transaction_date: '01/01/1971'.to_date, transaction_time: '10:00'.to_time,
                    transaction_exclusive: 99.01, transaction_quantity: 2, transaction_discount: 0,
                    description: "Test case TAX", last_buy_price: 95.01)
    assert_not stat.save
  end

  test "shouldn't save stat without transaction_quantity" do
    stat = Stat.new(transaction_date: '01/01/1971'.to_date, transaction_time: '10:00'.to_time,
                    transaction_exclusive: 99.01, transaction_tax: 0.99, transaction_discount: 0,
                    description: "Test case QUANTITY", last_buy_price: 95.01)
    assert_not stat.save
  end

  test "shouldn't save stat without transaction_discount" do
    stat = Stat.new(transaction_date: '01/01/1971'.to_date, transaction_time: '10:00'.to_time,
                    transaction_exclusive: 99.01, transaction_tax: 0.99, transaction_quantity: 2,
                    description: "Test case DISCOUNT", last_buy_price: 95.01)
    assert_not stat.save
  end

  test "shouldn't save stat without description" do
    stat = Stat.new(transaction_date: '01/01/1971'.to_date, transaction_time: '10:00'.to_time,
                    transaction_exclusive: 99.01, transaction_tax: 0.99, transaction_quantity: 2,
                    transaction_discount: 0, last_buy_price: 95.01)
    assert_not stat.save
  end

  test "shouldn't save stat without last_buy_price" do
    stat = Stat.new(transaction_date: '01/01/1971'.to_date, transaction_time: '10:00'.to_time,
                    transaction_exclusive: 99.01, transaction_tax: 0.99, transaction_quantity: 2,
                    transaction_discount: 0, description: "Test case PRICE")
    assert_not stat.save
  end

  test "shouldn't save stat when nil" do
    stat = Stat.new
    assert_not stat.save
  end

end
