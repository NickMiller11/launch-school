# The Array#zip method takes two arrays, and combines them into a single array
# in which each element is a two-element array where the first element is a
# value from one array, and the second element is a value from the second array,
# in order.

# For example:

# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# Write your own version of zip that does the same type of operation.
# It should take two Arrays as arguments, and return a new Array
# (the original Arrays should not be changed). Do not use the built-in
# Array#zip method. You may assume that both input arrays have the
# same number of elements.

# Example:

=begin

input: two arrays
output: one array including nested arrays with alternating elements from each
  - input array

rules:
- create an array with nested arrays containing elements at the same index
  - of each input array

algorithm:
- create a results array
- create a counter
- create a loop
  - push element at counter index from each array to results array
  - increment counter
  - break if counter equals array size
- return results array

=end

def zip(arr1, arr2)
  results = []
  counter = 0
  loop do
    results.push([arr1[counter], arr2[counter]])
    counter += 1
    break if counter == arr1.size
  end
  results
end



p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]