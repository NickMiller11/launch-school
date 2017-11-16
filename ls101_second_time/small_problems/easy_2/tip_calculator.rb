# Create a simple tip calculator. The program should prompt for a bill 
# amount and a tip rate. The program must compute the tip and then display 
# both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

=begin

input: request two inputs from user
output: 2 integers representing tip and total bill

Algorithm:
- ask user for bill total and assign to a variable
- ask user for a tip percentage and assign to a variable
- convert the tip percentage to the actual percentage number
- multiply tip percentage times bill and assign to a variable as tip
- add the tip back to the bill and display as the total

=end



puts("What is the bill?")
bill = gets.chomp.to_f
puts("What is the tip percentage?")
tip_percentage = gets.chomp.to_f

tip_actual = tip_percentage / 100
tip_amount = tip_actual * bill
bill_total = bill + tip_amount

tip_amount_rounded = format('%.2f', (tip_amount))
bill_total_rounded = format('%.2f', (bill_total))

puts("The tip is $#{tip_amount_rounded}")
puts("The total is $#{bill_total_rounded}")