# Write a program that asks the user to type something in, after which your
# program should simply display what was entered.
#
# Example:
#
# $ ruby repeater.rb
# >> Type anything you want:
# This is what I typed.
# This is what I typed.

=begin

Input: Input from user
Output: Print string to screen

Rule:
- print whatever the user entered as Input

Algorithm:
- ask user for Input
- initialize a variable and point to users Input
- print that variable to the screen

=end

puts "Please enter something: "
input = gets.chomp
puts input
