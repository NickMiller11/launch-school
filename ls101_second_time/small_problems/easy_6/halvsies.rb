# Write a method that takes an Array as an argument, and returns two Arrays that
# contain the first half and second half of the original Array, respectively.
# If the original array contains an odd number of elements, the middle element
# should be placed in the first half Array.

=begin

Input: array
Output: nested array

Rules:
- return a nested array that contains two arrays that each contain half of
  - the original arrays
- if the input array has an odd number of elements, include the middle element
  - in the first nested array

Algorithm:
- I can use an if statement
  - if the size of the input array is odd
    - set the first nested array to contain elements index 0 to size / 2
  - if the size of the input array is even
    - set the first nested array to contain elements index 0 to size / 2 - 1
  - set the second nested array to be the next index to index -1

=end

def halvsies(arr)
  if arr.size.odd?
    first = arr[0..(arr.size/2)]
    second = arr[(arr.size/2 + 1)..-1]
  else
    first = arr[0..(arr.size/2 - 1)]
    second = arr[(arr.size/2)..-1]
  end
  final_arr = [first, second]
end

def halvsies2(arr)
  first_half = arr.slice(0,(arr.size/2.0).ceil)
  second_half = arr.slice(first_half.size, arr.size - first_half.size)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]


p halvsies2([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies2([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies2([5]) == [[5], []]
p halvsies2([]) == [[], []]
