# Write a method that combines two Arrays passed in as arguments, and returns
# a new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.
#
# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

=begin

Input: two arrays
Output: array

Rules:
- return an array that combines values from each array alternating elements
- input arrays are non-empty
- input arrays have the same size

Algorithm:
- initialize new local variable and set to empty array
- iterate through one array
- push one element from each array on each iteration
- return new array

=end

def interleave(arr1, arr2)
  combined_arr = []
  counter = 0
  arr1.each do |el|
    combined_arr << el << arr2[counter]
    counter += 1
  end
  combined_arr
end

def interleave2(arr1, arr2)
  combined_arr = arr1.zip(arr2).flatten
end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
p interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
