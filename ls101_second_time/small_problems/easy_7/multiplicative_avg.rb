# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

=begin

Input: array of integers
Output: float

Rules:
- return a float that is the result of multiplying all integers in input array
  - together and then dividing by the number of elements in the array
- round result to 3 decimal places
- output the result
- array is non-empty

Algorithm:
- use inject method to get the sum of all integers
- divide the result by the size of the array
- use round method to round to nearest 3 decimals
--> format
=end

def show_multiplicative_average(arr)
  result = (arr.inject(1, :*) / arr.size.to_f)
  format('%.3f', result)
end

p show_multiplicative_average([3, 5])
# The result is 7.500

p show_multiplicative_average([6])
# The result is 6.000

p show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667
