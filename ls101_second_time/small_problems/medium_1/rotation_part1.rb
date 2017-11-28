# Write a method that rotates an array by moving the first element to the end 
# of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

=begin

Input: array
Output: array

Rules:
- move the first element to the end of the array
- do not modify the input array

Algorithm:
- initialize a new local variable and set to a sliced array of indexes 1..-1
- add index 0 of the input array to the end

=end

def rotate_array(arr)
  result_arr = arr[1..-1]
  result_arr << arr[0]
end


p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true