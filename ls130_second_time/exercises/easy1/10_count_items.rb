# Write a method that takes an array as an argument, and a block that returns
# true or false depending on the value of the array element passed to it.
# The method should return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

=begin

input: array, block
output: integer

rules:
- return an integer representing the number of times yielding an element to the
  - block returns true

algorithm:
- initialize a counter variable
- use each to iterate over the input array
- increment the counter variable each time yielding to the block returns true
- return counter

=end

# def count(arr)
#   count = 0
#   arr.each { |el| count += 1 if yield(el) }
#   count
# end

def count(arr)
  count = 0
  index = 0
  while index < arr.size do
    count += 1 if yield(arr[index])
    index += 1
  end
  count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Some other solutions I made/found that I liked

# def count(arr)
#   arr.reduce(0) do |memo, obj|
#     yield(obj) ? memo + 1 : memo
#   end
# end

# def count(arr, counter = 0, &block)
#   return counter if arr.empty?
#   count(arr.drop(1), &block) + (block.call(arr.first) ? 1 : 0)
# end

# def count(arr, &block) # I like this, you're passing the block into select as is
#   arr.select(&block).length
# end
