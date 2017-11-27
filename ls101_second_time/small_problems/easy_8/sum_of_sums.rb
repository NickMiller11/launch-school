# Write a method that takes an Array of numbers and then returns the sum of
# the sums of each leading subsequence for that Array. You may assume that
# the Array always contains at least one number.

=begin

Input: array
Output: integer

Rules:
- return an integer that is the sum of the sums of each leading sebsequence
  - in other words, it consectively adds to itself
- input array contains at least one element

Algorithm:
- iterative method like each with index
- initialize a new local variable for the sum
- use the index to slice the array and add the elements from index 0 to current index
- return the sum

=end

require "pry"

def sum_of_sums(arr)
  summation = 0
  arr.each_with_index do |num, idx|
    summation += arr[0..idx].sum
  end
  summation
end


p sum_of_sums([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
