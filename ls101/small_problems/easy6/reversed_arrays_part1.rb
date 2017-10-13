# Write a method that takes an Array as an argument, and reverses
# its elements in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(list)
  if list.length.even?
    center = list.length / 2
    increment = 1
    loop do
      list[center], list[center - increment] = list[center - increment],
      list[center]
      center += 1
      increment += 2
      break if center == list.length
    end
  else
    center = list.length / 2 + 1
    increment = 2
    loop do
      list[center], list[center - increment] = list[center - increment],
      list[center]
      center += 1
      increment += 2
      break if center == list.length
    end
  end
  p list
end



list = [1,2,3,4,5]
result = reverse!(list) # => [4,3,2,1]
# list == [4, 3, 2, 1]
# list.object_id == result.object_id
#
list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
# list == ["e", "d", "c", "b", "a"]
#
list = ['abc']
reverse!(list) # => ["abc"]
# list == ["abc"]
