# build a program that displays when the user will 
# retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

=begin

input: two user inputs representing current age and desired retirement age
output: two strings with integers in each

algorithm:
- ask user for current age and assign to a variable
- ask user their desired retirement age and assign to a variable
- calculate retirement year by finding the difference between the two ages
  - and adding that to the current year
- print string telling user when they will retire
- print string with difference between two ages

=end

puts("What is your age?")
current_age = gets.chomp.to_i
puts("At what age would you like to retire?")
retirement_age = gets.chomp.to_i

years_to_retirement = retirement_age - current_age
retirement_year = Time.now.year + years_to_retirement

puts("It's #{Time.now.year}.  You will retire in #{retirement_year}.")
puts("You have only #{years_to_retirement} years of work to go!")