# NOTE: This exercise was originally a duplicate from the previous exercise set.
# We have modified it slightly, but some of the posted solutions still reflect
# the original wording.

# The Enumerable#count method iterates over the members of a collection,
# passing each element to the associated block. It then returns the number
# of elements for which the block returns a truthy value.

# Write a method called count that behaves similarly for an arbitrarily long
# list of arguments. It should take 0 or more arguments and a block,
# and then return the total number of arguments for which the block returns true.

# If the argument list is empty, count should return 0.

# Your method may use #each, #each_with_object, #each_with_index, #inject,
# loop, for, while, or until to iterate through the Array passed in as an
# argument, but must not use any other methods that iterate through an
# Array or any other collection.

=begin

input: 0 or more arguments
output: integer

rules:
- return an integer representing number of times block yields true when
  element is passed into it
- return 0 if no arguments

algorithm:
- instantiate a counter variable
- use each to iterate over array
- increment counter if yielding to it returns true
- return counter

=end

def count(*int)
  count = 0
  int.each { |el| count += 1 if yield(el) }
  count
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3