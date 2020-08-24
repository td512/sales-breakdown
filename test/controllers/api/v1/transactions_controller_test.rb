require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionDispatch::IntegrationTest

  test "should return 200 OK" do
    get api_v1_transactions_path
    assert_response :success
  end

  test "should have a startDate" do
    get api_v1_transactions_path
    assert_response :success
    json = response.parsed_body
    assert_equal json["startDate"], "2003-07-13"
  end

  test "should have an endDate" do
    get api_v1_transactions_path
    assert_response :success
    json = response.parsed_body
    assert_equal json["endDate"], "2004-07-13"
  end

  test "should have a transactionCount" do
    get api_v1_transactions_path
    assert_response :success
    json = response.parsed_body
    assert_equal json["transactionCount"], 81
  end

  test "should have a transactionsByYear year of 2004" do
    get api_v1_transactions_path
    assert_response :success
    json = response.parsed_body
    assert_equal json["transactionsByYear"]["2004"], 80
  end

  test "show should return 200 OK" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
  end

  test "show should have a currency_symbol" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
    json = response.parsed_body
    assert_equal json["currency_symbol"], '$'
  end

  test "show should have a previousSalesTransactionValueByMonth month of 2003-07" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
    json = response.parsed_body
    assert_equal json["previousSalesTransactionValueByMonth"]["2003-07"], '12.28'
  end

  test "show should have a previousSalesTransactionsByMonth month of 2003-07" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
    json = response.parsed_body
    assert_equal json["previousSalesTransactionValueByMonth"]["2003-07"], '12.28'
  end

  test "show should have a previousTaxTransactionValueByMonth month of 2003-07" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
    json = response.parsed_body
    assert_equal json["previousTaxTransactionValueByMonth"]["2003-07"], '1.22'
  end

  test "show should have a currentSalesTransactionValueByMonth month of 2004-04" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
    json = response.parsed_body
    assert_equal json["currentSalesTransactionValueByMonth"]["2004-04"], '119.27'
  end

  test "show should have a currentSalesTransactionsByMonth month of 2004-04" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
    json = response.parsed_body
    assert_equal json["currentSalesTransactionsByMonth"]["2004-04"], 39.0
  end

  test "show should have a currentTaxTransactionValueByMonth month of 2004-04" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
    json = response.parsed_body
    assert_equal json["currentTaxTransactionValueByMonth"]["2004-04"], '11.93'
  end

  test "show should have a currentProfitTransactionValueByMonth month of 2004-04" do
    get api_v1_transaction_path('2004-01-01')
    assert_response :success
    json = response.parsed_body
    assert_equal json["currentProfitTransactionValueByMonth"]["2004-04"], '131.20'
  end

end
