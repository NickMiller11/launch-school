# Write a program that solicits 6 numbers from the user, 
# then prints a message that describes whether or not the 6th number 
# appears amongst the first 5 numbers.

puts("Enter the 1st number:")
one = gets.chomp.to_i
puts("Enter the 2nd number:")
two = gets.chomp.to_i
puts("Enter the 3rd number:")
three = gets.chomp.to_i
puts("Enter the 4th number:")
four = gets.chomp.to_i
puts("Enter the 5th number:")
five = gets.chomp.to_i
puts("Enter the last number:")
last = gets.chomp.to_i

arr = [one, two, three, four, five]
if arr.include?(last)
  puts("The number #{last} appears in #{arr}.")
else
  puts("The number #{last} does not appear in #{arr}.")
end
