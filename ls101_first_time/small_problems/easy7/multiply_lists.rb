# Write a method that takes two Array arguments in which each Array contains
# a list of numbers, and returns a new Array that contains the product of
# each pair of numbers from the arguments that have the same index.
# You may assume that the arguments contain the same number of elements.

def multiply_list(arr1, arr2)
  product_arr = []
  counter = 0

  loop do
    product_arr[counter] = (arr1[counter] * arr2[counter])
    counter += 1
    break if counter == arr1.size
  end
  product_arr
end

def multiply_list_ls(arr1, arr2)
  product_arr = []
  arr1.each_with_index do |num, i|
    product_arr << num * arr2[i]
  end
  product_arr
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list_ls([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
