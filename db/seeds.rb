# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
file = File.join(Rails.root, 'storage', 'store_data.csv')
begin
  csv = CSV.parse(File.read(file), headers: true)
  csv.by_row.each_with_index do |row, idx|
    transaction = Stat.new(transaction_date: row[7], transaction_time: row[8], rrp: row[1], last_buy_price: row[2],
                              description: row[3], category: row[5], transaction_quantity: row[11],
                              transaction_exclusive: row[12], transaction_tax: row[13], transaction_discount: row[14])
    if transaction.save
      puts "Imported Transaction ##{idx}: SOLD #{row[11]} #{row[3]} (#{row[5] ? row[5] : 'NULL'}) on #{row[7]} at #{row[8]}"
    else
      puts "Failed to import transaction ##{idx}: Could not save record!"
    end
  end
rescue Errno::ENOENT
  puts "Failed to load CSV #{file}!"
  exit 66 # Cannot open input file, see sysexits manpage
end