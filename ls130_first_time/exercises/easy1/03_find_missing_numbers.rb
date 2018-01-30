=begin

Write a method that takes a sorted array of integers as an argument,
and returns an array that includes all of the missing integers
(in order) between the first and last elements of the argument.

input: sorted array
output: array containing all missing numbers in between first and last element
  of input array

rules: see above

algorithm:
- set a counter equal to the first element
- increment counter by one
- check to see if that number is included in the input array
  - add to new array if not
  - skip if so
- break loop once counter reaches last element

=end

def missing(arr)
  counter = arr[0]
  final_array = []
  loop do
    break if arr.size == 1
    counter += 1
    break if counter == arr[-1]
    next if arr.include?(counter)
    final_array << counter
  end
  final_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []


# LS solution

# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end
