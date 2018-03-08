# The Enumerable#each_with_index method iterates over the members of a collection,
# passing each element and its index to the associated block.
# The value returned by the block is not used. each_with_index returns a
# reference to the original collection.

# Write a method called each_with_index that behaves similarly for Arrays.
# It should take an Array as an argument, and a block. It should yield each
# element and an index number to the block. each_with_index should return a
# reference to the original Array.

# Your method may use #each, #each_with_object, #inject, loop, for, while, or
# until to iterate through the Array passed in as an argument, but must not use
# any other methods that iterate through an Array or any other collection.

=begin

input: array
output: input array

rules:
- yield each element in the input array to the block
- return a reference to th original array

algorithm:
- let's use counters!
- instantiate a counter variable
- while counter < array.size do
- yield(arr[counter], counter)
- return input array

=end

def each_with_index(arr)
  index = 0
  while index < arr.size do
    yield(arr[index], index)
    index += 1
  end
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

# other solutions that I worked on/found

# recursive
# def each_with_index(arr, index=0, &block)
#   index < arr.size ? block.call(arr[index], index) : (return arr)
#   each_with_index(arr, index + 1, &block)
# end

# # reduce
# def each_with_index(arr)
#   arr.reduce(0) do |idx, val|
#     yield(val, idx)
#     idx += 1
#   end
#   arr
# end