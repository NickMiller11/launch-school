# Write a program that prints 'Launch School is the best!' repeatedly until
# a certain number of lines have been printed. The program should obtain the
# number of lines from the user, and should insist that at least 3 lines are printed.
#
# For now, just use #to_i to convert the input value to an Integer, and check
# that result instead of trying to insist on a valid number; validation of
# numeric input is a topic with a fair number of edge conditions that are
# beyond the scope of this exercise.

=begin

Input: Input from user
Output: Print string to screen

Rules:
- use input from user to determine how many lines get printed
- make sure at least three lines are printed

Algorithm:
- ask user to input how many times string should be printed to screen
- initialize a variable and assign to user input
- create a loop
- validate that the input was a positive integer greater than 2
- break if input is validated
- ask user to input again if not validated
- use times method to print out string

=end

# Solution 1

puts "How many times should we print out 'Launch School is the best!'? (At least 3)"
input = gets.chomp.to_i

loop do
  break if input >= 3
  puts "Please enter a positive integer greater than or equal to 3"
  input = gets.chomp.to_i
end

input.times do
  puts "Launch School is the best!"
end
