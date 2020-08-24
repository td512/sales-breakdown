json.prettify!

json.startDate @start_date
json.endDate @end_date
json.transactionCount Stat.count
json.transactionsByYear do
  @year_information.each{ |key, value| json.set! key, value }
end