# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the
# array, false if it is not. You may not use the Array#include? method in
# your solution.

=begin

Input: array, search value
Output: boolean

Rules:
- return a boolean to show if the search value occurs in the array

Algorithm:
- use the find method to iterate through the array and look for the value

=end

def include?(arr, search_val)
  # return false if arr.empty?
  # arr.find { |element| element == search_val } == search_val
  arr.each { |element| return true if element == search_val }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
