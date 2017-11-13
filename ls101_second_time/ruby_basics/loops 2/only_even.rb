# Using next, modify the code below so that it only prints even numbers.

=begin

input: integer
output: print integers to screen

rules:
- print only even numbers

algorithm:
- add a next if number.odd? statement

=end

# Solution 1

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# Solution 2

number = 0

until number == 10
  number += 1
  puts number if number.even?
end
