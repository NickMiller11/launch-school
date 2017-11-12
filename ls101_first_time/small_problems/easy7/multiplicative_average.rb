# Write a method that takes an Array of integers as input, multiplies
# all the numbers together, divides the result by the number of entries
# in the Array, and then prints the result rounded to 3 decimal places.
# Assume the array is non-empty.

require 'pry'

def show_multiplicative_average(arr)
  total = 1.0
  arr.each do |num|
    total *= num
  end
  result = "%.3f" % (total / arr.size)
  result
end

def show_multiplicative_average_ls(arr)
  total = 1.to_f
  arr.each { |num| total *= num }
  result = format('%.3f', (total / arr.size))
  result
end

p show_multiplicative_average([3, 5])
# The result is 7.500

p show_multiplicative_average([6])
# The result is 6.000

p show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

p show_multiplicative_average_ls([3, 5])
# The result is 7.500

p show_multiplicative_average_ls([6])
# The result is 6.000

p show_multiplicative_average_ls([2, 5, 7, 11, 13, 17])
# The result is 28361.667
