# Write a program that asks the user to enter an integer greater than 0, 
# then asks if the user wants to determine the sum or product of all 
# numbers between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

=begin

Input: Get user input on integer and operation
Output: String with integer

Rules:
- output a string with the sum or product of all integers between 1 and 
  - users number depending on selected operation

Algorithm:
- prompt user for integer and assign to a variable
- prompt user for operation and assign to a variable
- use reduce method to perform operation and save to a variable
- output string with last variable interpolated

=end

def addition(number)
  (1..number).reduce(:+)
end

def multiplication(number)
  (1..number).reduce(:*)
end

puts("Please enter an integer greater than 0:")
positive_int = gets.chomp.to_i
puts("Enter 's' to compute the sum, 'p' to compute the product")
operation = gets.chomp

case operation
when 's'
  sum = addition(positive_int)
  puts("The sum of the integers between 1 and #{positive_int} is #{sum}.")
when 'p'
  product = multiplication(positive_int)
  puts("The product of the integers between 1 and #{positive_int} is #{product}.")
end