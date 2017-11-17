# Write a method that searches for all multiples of 3 or 5 that lie between
# 1 and some other number, and then computes the sum of those multiples.
# For instance, if the supplied number is 20, the result should be 98
# (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

=begin

Input: integer
Output: integer

Rules:
- return the sum of all integers divisible by 3 or 5 between 1 and input integer

Algorithm:
- use upto

=end

def multisum(int)
  sum = 0
  1.upto(int) { |num| sum += num if num % 3 == 0 || num % 5 == 0 }
  sum
end

def multisum(int)
  arr = []
  1.upto(int) { |num| arr << num if num % 3 == 0 || num % 5 == 0 }
  arr.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
