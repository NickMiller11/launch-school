# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.
#
# You may assume that the argument will always be a valid integer that is
# greater than 0.

=begin

Input: integer
Output: array

Rules:
- return an array that includes all integers between 1 and input integer

Algorithm:
- use upto method, pushing each value into an array.  Return the array

=end

def sequence(num)
  final_arr = []
  1.upto(num) { |int| final_arr << int }
  final_arr
end


p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(-5) #== [1]
