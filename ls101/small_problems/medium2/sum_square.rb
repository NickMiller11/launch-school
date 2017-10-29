# Write a method that computes the difference between the square of
# the sum of the first n positive integers and the sum of the squares
# of the first n positive integers.

=begin

Input: integer
Output: integer

This can be broken down into two pieces; the left side and the right side
of the equation

After fiddling around in IRB, I figured out the left side can be solved by
assigning the following to a variable and then squaring that variable
(1..num).inject(:+)

The right side of the equation can be solved with:
(1..3).inject { |sum, v| sum + v**2 }

I'm going to assign each side of the equation to a variable and subtract them

=end

def sum_square_difference(int)
  squared_sum = (1..int).inject(:+)
  squared_sum = squared_sum**2
  sum_squared = (1..int).inject { |sum,v| sum + v**2 }
  squared_sum - sum_squared
end

p sum_square_difference(3) #== 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) #== 2640
p sum_square_difference(1) #== 0
p sum_square_difference(100) #== 25164150
