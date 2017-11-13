# Write a program that requests two integers from the user, adds them together,
# and then displays the result. Furthermore, insist that one of the integers be
# positive, and one negative; however, the order in which the two integers are
# entered does not matter.
#
# Do not check for positive/negative requirement until after both integers are
# entered, and start over if the requirement is not met.

=begin

Input: Two integers from user
Output: String with result of adding two integers together

Rules:
- Need to validate input are both integers not equal to 0
- Need to validate one integer is positive and one is negative

Algorithm:
- Ask user for each integer
- call valid_number? method on each integer
- check if one integer is positive and one is negative
- use a loop to prompt user to reenter if doesn't pass
- add both numbers together and print the result

=end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

first_num = nil
second_num = nil
loop do
  puts "Please enter a positive or negative integer."
  first_num = gets.chomp
  puts "Please enter a positive or negative integer."
  second_num = gets.chomp
  if valid_number?(first_num) == false || valid_number?(second_num) == false
    puts "Invalid input. Only non-zero integers are allowed."
  elsif first_num.to_i * second_num.to_i > 0
    puts "Sorry. One integer must be positive, one must be negative."
  else
    break
  end
end

result = first_num.to_i + second_num.to_i
puts "#{first_num} + #{second_num} is #{result}"
