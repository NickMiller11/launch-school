# Write a method that returns a list of all of the divisors of the
# positive integer passed in as an argument. The return value can be
# in any sequence you wish.
#
# Examples

=begin

input: integer
output: array of integers

rules:
- return an array that includes all divisors of the input integer.
- divisors include 1 and the input integer

algorithm:
- iterate through all numbers from 1 up to input / 2
- push all numbers that are input modulo num == 0 to the result array

=end

require 'pry'

# My initial solution

# def divisors(int)
#   result = [int]
#   1.upto(int / 2) do |num|
#     result << num if int % num == 0
#   end
#   result.sort
# end

# My solution for 'Further Exploration'

# def divisors(int)
#   result = []
#   1.upto(int / 4) do |num|
#     if int % num == 0
#       result << num
#       result << int / num
#     end
#   end
#   result.uniq.sort
# end

# My refactored solution after reading some other students

def divisors(int)
  result = []
  1.upto(int) do |num|
    if int % num == 0
      break if result.include?(num)
      result << num
      result << int / num unless int == num**2
    end
  end
  result.sort
end




p divisors(1) #== [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
