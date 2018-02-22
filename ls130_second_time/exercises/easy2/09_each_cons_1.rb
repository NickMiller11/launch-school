# The Enumberable#each_cons method iterates over the members of a collection
# taking each sequence of n consecutive elements at a time and passing them to
# the associated block for processing. It then returns a value of nil.

# Write a method called each_cons that behaves similarly for Arrays,
# taking the elements 2 at a time. The method should take an Array as an
# argument, and a block. It should yield each consecutive pair of elements
# to the block, and return nil.

# Your method may use #each, #each_with_object, #each_with_index, #inject,
# loop, for, while, or until to iterate through the Array passed in as an
# argument, but must not use any other methods that iterate through an Array
# or any other collection.

=begin

input: array, block
output: nil

rules:
- yield two elements next to each other from the array to the block until
  each successive pair has been yielded.  Start at index 0
- return nil

algorithm:
- use each with index to iterate over the array
- break when index == arr.size - 2
- return nil

=end

def each_cons(arr)
  arr.each_with_index do |value, index|
    break if index == arr.size - 1
    yield(value, arr[index + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end

p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end

p hash == {'a' => 'b'}