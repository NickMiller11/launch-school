# Write a method that takes two Arrays as arguments, and returns an Array
# that contains all of the values from the argument Arrays. There should be
# no duplication of values in the returned Array, even if there are duplicates
# in the original Arrays.

=begin

Input: two arrays
Output: one array

Rules:
- return an array that combines elements from both input arrays with no duplicates

Algorithm:
- use the set union method

=end

def merge(arr1, arr2)
  arr1 | arr2
end

def merge2(arr1, arr2)
  (arr1 + arr2).uniq!
end


p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
