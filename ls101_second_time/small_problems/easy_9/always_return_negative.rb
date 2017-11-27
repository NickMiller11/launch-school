# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number. If the number is 0
# or negative, return the original number.

=begin

Input: integer
Output: negative integer

Rules:
- return a negative integer if input is positive
- return input if input is 0 or negative

Algorithm:
- check if input is 0 or less.  If so, return input.  If not, return input * -1

=end

def negative(num)
  num <= 0 ? num : num * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
