# Modify the code below so that the user's input gets added to the numbers array.
# Stop the loop when the array contains 5 numbers.

=begin

Input: Input from user
Output: Print Array to screen

Rule:
- add numbers input by user to array
- stop loop when array's size is 5

Algorithm:
- push input to array
- break when array.size is 5

=end

# Solution 1

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
  break if numbers.size == 5
end
puts numbers

# Solution 2

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers.push(input)
  break if numbers.size == 5
end
puts numbers
