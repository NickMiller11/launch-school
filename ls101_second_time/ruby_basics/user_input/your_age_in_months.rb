# Write a program that asks the user for their age in years,
# and then converts that age to months.

# Examples:
#
# $ ruby age.rb
# >> What is your age in years?
# 35
# You are 420 months old.

=begin

Input: Input from user
Output: Print string to screen

Rules:
- convert input from years to months

Algorithm:
- print message to screen asking user for age in years
- initialize variable and point to user input, converting to integer
- multiply variable by 12
- print variable in string to screen

=end

# Solution 1

puts "Please enter your age in years: "
age_years = gets.chomp.to_i
age_months = age_years * 12
puts "You are #{age_months} months old."

# Solution 2

puts "Please enter your age in years: "
age = gets.chomp.to_i
puts "You are " + (age * 12).to_s + " months old."
