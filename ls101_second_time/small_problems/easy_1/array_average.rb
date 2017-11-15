# Write a method that takes one argument, an array containing integers, 
# and returns the average of all numbers in the array. The array will never 
# be empty and the numbers will always be positive integers.

=begin

Input: array
Output: integer

Rules:
- return the average of all integers in the array

Algorithm:
- use reduce to sum up all of the numbers and divide by the size of the array

=end


def average(arr)
  sum = arr.reduce(:+).to_f 
  sum / arr.size
end


puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40