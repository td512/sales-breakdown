json.prettify!

json.currency_symbol '$'

json.previousSalesTransactionValueByMonth do
  @sales['previous'].sort.each{ |key, value| json.set! key, number_with_precision(value, precision: 2) }
end

json.previousSalesTransactionsByMonth do
  @tx['previous'].sort.each { |key, value| json.set! key, value }
end

json.previousTaxTransactionValueByMonth do
  @tax['previous'].sort.each{ |key, value| json.set! key, number_with_precision(value, precision: 2) }
end

json.previousProfitTransactionValueByMonth do
  @profits['previous'].sort.each{ |key, value| json.set! key, number_with_precision(value, precision: 2) }
end

json.currentSalesTransactionValueByMonth do
  @sales['current'].sort.each{ |key, value| json.set! key, number_with_precision(value, precision: 2) }
end

json.currentSalesTransactionsByMonth do
  @tx['current'].sort.each { |key, value| json.set! key, value }
end

json.currentTaxTransactionValueByMonth do
  @tax['current'].sort.each{ |key, value| json.set! key, number_with_precision(value, precision: 2) }
end

json.currentProfitTransactionValueByMonth do
  @profits['current'].sort.each{ |key, value| json.set! key, number_with_precision(value, precision: 2) }
end
