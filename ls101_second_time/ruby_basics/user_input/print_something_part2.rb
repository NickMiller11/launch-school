# In the previous exercise, you wrote a program that asks the user
# if they want the program to print "something". However, this program
#   recognized any input as valid: if you answered anything but y,
#   it treated it as an n response, and quit without printing anything.
#
# Modify your program so it prints an error message for any inputs
# that aren't y or n, and then asks you to try again. Keep asking
# for a response until you receive a valid y or n response. In addition,
#   your program should allow both Y and N (uppercase) responses;
#   case sensitive input is generally a poor user interface choice.
#     Whenever possible, accept both uppercase and lowercase inputs.

# Examples:
#
# $ ruby something2.rb
# >> Do you want me to print something? (y/n)
# y
# something
#
# $ ruby something2.rb
# >> Do you want me to print something? (y/n)
# help
# >> Invalid input! Please enter y or n
# >> Do you want me to print something? (y/n)
# Y
# something
#
# $ ruby something2.rb
# >> Do you want me to print something? (y/n)
# N
#
# $ ruby something2.rb
# >> Do you want me to print something? (y/n)
# NO
# >> Invalid input! Please enter y or n
# >> Do you want me to print something? (y/n)
# n

=begin

Input: Input from user
Output: Print string to screen

Rules:
- validate input to allow only y or n
- loop so that it keeps asking until valid input provided

Algorithm:
Ask user for input
Initialize a variable and assign to users input
create a loop
create an if statement that prints string and breaks if users input is y
create an elsif statement that just breaks if users input is n
cretae an else statement that requests valid input from user

=end

# Solution 1

puts "Do you want me to print something?"
input = gets.chomp.downcase

loop do
  if input == 'y'
    puts "Something"
    break
  elsif input == 'n'
    break
  else
    puts "Invalid input!  Please enter y or n"
    input = gets.chomp.downcase
  end
end

# Solution 2

puts "Do you want me to print something?"
input = gets.chomp.downcase

unless input == 'y' || input == 'n'
  puts "Invalid input!  Please enter y or n"
  input = gets.chomp.downcase
end

puts "Something" if input == 'y'
