# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.
#
# You may assume that neither argument is an empty Array.

=begin

Input: two arrays
Output: one array

Rules:
- return an array that contains product of each pair of numbers from input arrays
- sort in increasing value
- input arrays are not empty

Algorithm:
- initialize new local variable for result
- two each methods
- multiply each and push to result variable
- call sort on result variable

=end

def multiply_all_pairs(arr1, arr2)
  result_arr = []
  arr1.each do |num|
    arr2.each do |int|
      result_arr << int * num
    end
  end
  result_arr.sort
end

def multiply_all_pairs2(arr1, arr2)
  arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs2([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]
