# Write a program that displays a welcome message, but only after the user
# enters the correct password, where the password is a string that is defined
# as a constant in your program. Keep asking for the password until the user
# enters the correct password.

=begin

Input: Input from user
Output: Print string to screen

Rules:
- store password to constant
- show welcome message if user enters correct password
- keep prompting user for password until correct

Algorithm:
- initialize password constant and assign to password string
- print message to screen asking user for password
- initialize a variable and assign it to users input
- create an unless statement that states unless the input variable equals the
  - password, then the user gets prompted for the password
- show a welcome message

=end

PASSWORD = 'password'

# Solution 1

puts "Please enter the password:"
user_pass = gets.chomp

loop do
  break if user_pass == PASSWORD
  puts "Please re-enter password"
  user_pass = gets.chomp
end

puts "Welcome inside the system!"

# Solution 2

puts "Please enter the password:"
user_pass = gets.chomp

while user_pass != PASSWORD
  puts "Please re-enter password"
  user_pass = gets.chomp
end

puts "Welcome inside the system!"
