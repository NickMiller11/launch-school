# Write a method that takes an Array, and returns a new Array with the
# elements of the original list in reverse order. Do not modify the original list.
#
# You may not use Array#reverse or Array#reverse!, nor may you use the method
# you wrote in the previous exercise.

=begin

Input: Array
Output: Array

Rules:
- return a new array that is the input array in reversed order
- may not use Array#reverse or Array#reverse! methods
- do not modify original array

Algorithm:
- initialize new array
- iterate backwards through input array
- push values to new array

=end

def reverse(arr)
  reversed_arr = []
  counter = arr.size
  return reversed_arr if arr.size == 0
  loop do
    counter -= 1
    reversed_arr << arr[counter]
    break if counter == 0
  end
  reversed_arr
end

def reverse2(arr)
  result_arr = []
  arr.reverse_each { |element| result_arr << element }
  result_arr
end

def reverse3(arr)
  result_arr = []
  arr.each { |element| result_arr.unshift(element) }
  result_arr
end

# p reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true
#
# p list = [1, 2, 3]                      # => [1, 2, 3]
# p new_list = reverse(list)              # => [3, 2, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 2, 3]                     # => true
# p new_list == [3, 2, 1]                 # => true

# p reverse2([1,2,3,4]) #== [4,3,2,1]          # => true
# p reverse2(%w(a b c d e)) == %w(e d c b a)  # => true
# p reverse2(['abc']) == ['abc']              # => true
# p reverse2([]) == []                        # => true
#
# p list = [1, 2, 3]                      # => [1, 2, 3]
# p new_list = reverse2(list)              # => [3, 2, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 2, 3]                     # => true
# p new_list == [3, 2, 1]                 # => true

p reverse3([1,2,3,4]) #== [4,3,2,1]          # => true
p reverse3(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse3(['abc']) == ['abc']              # => true
p reverse3([]) == []                        # => true

p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse3(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
