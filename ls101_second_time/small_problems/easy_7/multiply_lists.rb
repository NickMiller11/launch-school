# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index. You may assume
# that the arguments contain the same number of elements.

=begin

Input: two arrays
Output: one array

Rules:
- return an array that is the product of input array values from the same index
- arrays contain the same number of elements

Algorithm:
- initialize a new local variable for result array
- use Array#each_with_index method
- multiply values from same index together and add to new array

=end

def multiply_list(arr1, arr2)
  result_arr = []
  arr1.each_with_index do |num, idx|
    result_arr << num * arr2[idx]
  end
  result_arr
end

def multiply_list2(arr1, arr2)
  result_arr = arr1.zip(arr2).map { |pair| pair.inject(:*) }
end



p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
