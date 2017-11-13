# Write a program that obtains two Integers from the user, then prints the
# results of dividing the first by the second. The second number must not be 0,
# and both numbers should be validated using this method:
#
# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end

# This method returns true if the input string can be converted to an Integer
# and back to a string without loss of information, false otherwise. It's not a
# perfect solution in that some inputs that are otherwise valid (such as 003) will
# fail, but it is sufficient for this exercise.

=begin

Input: Integers input by the user
Output:  Prints result of dividing both numbers to the screen

Rules:
- use the valid_number? method to validate the inputs
- the second number cannot be 0
- return the number obtained by dividing the first number by the second

Outcome:
- ask the user for first number
- validate number via valid_number? method
- ask the user for second number
- validate number via valid_number? method
- validate that second number isn't 0
- divide the two numbers and print the result

=end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

number_one = nil
number_two = nil

loop do
  puts "Please enter a numerator"
  number_one = gets.chomp
  break if valid_number?(number_one)
  puts "Invalid input, only integers are allowed"
end

loop do
  puts "Please enter a denominator"
  number_two = gets.chomp
  break if valid_number?(number_two) && number_two.to_i != 0
  puts "Invalid input. A denominator of 0 is not allowed."
end

puts "#{number_one} / #{number_two} is #{number_one.to_i / number_two.to_i}."
