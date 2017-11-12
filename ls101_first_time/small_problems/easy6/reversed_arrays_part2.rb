# Write a method that takes an Array, and returns a new Array with the
# elements of the original list in reverse order.
# Do not modify the original list.

def reverse(list)
  new_list = list.dup
  list.freeze
  left_index = 0
  right_index = -1
  loop do
    break if left_index == list.length / 2
    new_list[left_index], new_list[right_index] =
    new_list[right_index], new_list[left_index]
    left_index += 1
    right_index -= 1
  end
  new_list
end



p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
