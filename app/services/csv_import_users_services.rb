# class CsvImportUsersService
# require 'csv'

# def call(file)
# 	file =File.open(file)
#     csv = CSV.parse(file, headers: true)
#     csv.each do |row|
#       user_hash = User.new
#       user_hash[:firstname] = row['First Name']
#       user_hash[:lastname] = row['Last Name']
#       user_hash[:email] = row['Email']  
#       user_hash[:address] = row['Address']
#       user_hash[:mobile_number] = row['Mobile_Number']
#       User.find_or_create_by!(user_hash)
#     end
#   end
# end