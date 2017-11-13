# In the previous exercise, you wrote a program to solicit a password.
# In this exercise, you should modify the program so it also requires a user name.
# The program should solicit both the user name and the password,
# then validate both, and issue a generic error message if one or both are
# incorrect; the error message should not tell the user which item is incorrect.

=begin

Input: Input from user
Output: Print string to screen

Rules:
- validate both a user name and password
- don't tell user which line is incorrect

Algorithm:
- initialize constants for both username and password
- ask user for username
- initialize variable and assign it to users input
- ask user for password
- initialize variable and assign it to users input
- create a loop
- check variables against constants
- break if variables match constants
- otherwise, ask user to reenter credentials
- print welcome message

=end

USERNAME = 'nick'
PASSWORD = 'miller'

user_try = nil
pass_try = nil
loop do
  puts "Please enter your username"
  user_try = gets.chomp
  puts "Please enter your password"
  pass_try = gets.chomp
  break if user_try == USERNAME && pass_try == PASSWORD
  puts "Authorization failed! Please re-enter credentials"
end

puts "Welcome!"
