# Create a simple tip calculator. The program should prompt
# for a bill amount and a tip rate. The program must compute
# the tip and then display both the tip and the total amount of the bill.

puts("What is the bill?")
bill = Kernel.gets().chomp().to_f
puts("What is the tip percentage?")
tip_percent = Kernel.gets().chomp().to_f / 100
tip = (bill * tip_percent).round(2)
total = (bill + tip).round(2)

puts("The tip is $#{tip}
The total is $#{total}")
