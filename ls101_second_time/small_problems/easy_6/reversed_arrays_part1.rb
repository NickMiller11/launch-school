# Write a method that takes an Array as an argument, and reverses its
# elements in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.
#
# You may not use Array#reverse or Array#reverse!.

=begin

input: array
output: array

Rules:
- reverse the elements of an array in place
- the returned array needs to have the same object_id as the input array
- cannot use Array#reverse or Array#reverse! method

Algorithm:
- I can iterate through this array, deleting an element at an index point
  - that I iterate through.
- I can then unshift the value back onto the array to reverse the order.

=end

def reverse!(list)
  list.map do |element|
    list.delete(element)
    list.unshift(element)
  end
  list
end


list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []
