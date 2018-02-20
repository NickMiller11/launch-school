# The Greek mathematician Nicomachus devised a classification scheme for
# natural numbers, identifying each as belonging uniquely to the categories
# of abundant, perfect, or deficient. A perfect number equals the sum of its
# positive divisors — the pairs of numbers whose product yields the target
# number, excluding the number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number

# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.

# Write a program that can tell if a number is perfect, abundant or deficient.

=begin

input: integer
output: string

rules:
- return 'deficient' if the sum of a numbers divisors is less than the number
- return 'abundant' if the sum of a numbers divisors is more than the number
- return 'perfect' if the sum of a numbers divisors is equal to the number
- raise a RuntimeError if number less than 1

algorithm:
- iterate from 1 to the number, use modulo to create array of divisors
- reduce the array and compare

=end

# class PerfectNumber
#   def self.classify(num)
#     raise RuntimeError, 'Please give a positive number' if num < 0

#     result = (1...num).select { |digit| num % digit == 0 }.reduce(:+)

#     case result
#     when 0...num then 'deficient'
#     when num then 'perfect'
#     else 'abundant'
#     end

#   end
# end

=begin

Notes from video:

- make sure to not include the number in the range using three dots ...

- if you are going to define only class methods, you can add class << self
  to the line after the class definition to define everything as a class method

  ex:

  class PerfectNumber
    class << self
      def classify(number) # this is now a class method

  More here - http://yehudakatz.com/2009/11/15/metaprogramming-in-ruby-its-all-about-the-self/

- on class instance variables (one student had in their  max_rotation code)
  Dave Thomas on Ruby Object Models - https://www.youtube.com/watch?v=X2sgQ38UDVY
  

=end

=begin

input: integer
output: integer

rules:
- rotate the input integer n times where n is the size
- for each rotation, affix the leftmost digits, moving inwards 1 digit each time


algorithm:
- create a variable to holds the index
- loop do
-   at that index, slice the number and move it to the ones place
-   increment the variable
-   break if the variable == int.digits.size

return the integer
=end

require 'pry'

def max_rotation(number)
  index = 0
  num_array = number.digits.reverse

  while index < number.digits.size do
    digit = num_array.slice!(index)
    num_array << digit
    index += 1
  end

  num_array.join('').to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845
