# Write a method that returns an Array that contains every other element 
# of an Array that is passed in as an argument. The values in the returned list 
# should be those values that are in the 1st, 3rd, 5th, 
# and so on elements of the argument Array.

=begin

Input: array
Output: array

Rules:
- return array with every odd indexed item deleted

Algorithm:
- use each with index to iterate over the array and push odd index values
  - to new array

=end

def oddities(arr)
  new_arr = []
  arr.each_with_index { |v, idx| new_arr << v if idx.even? }
  new_arr
end

def evensies(arr)
  new_arr = []
  arr.each_with_index { |v, idx| new_arr << v if idx.odd? }
  new_arr
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

p evensies([2, 3, 4, 5, 6]) == [3, 5]
p evensies(['abc', 'def']) == ['def']
p evensies([123]) == []
p evensies([]) == []