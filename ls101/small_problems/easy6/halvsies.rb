# Write a method that takes an Array as an argument, and returns
# two Arrays that contain the first half and second half of the
# original Array, respectively. If the original array contains
# an odd number of elements, the middle element should be placed
# in the first half Array.

# def halvsies(arr)
#   middle = arr.length / 2
#   new_arr = []
#   if arr.length.even?
#     a = arr[0..middle - 1]
#     b = arr[middle..-1]
#     new_arr << a << b
#   else
#     a = arr[0..middle]
#     b = arr[middle + 1..-1]
#     new_arr << a << b
#   end
# end

def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end



p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
