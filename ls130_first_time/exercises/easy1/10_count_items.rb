# Write a method that takes an array as an argument,
# and a block that returns true or false depending on the
# value of the array element passed to it. The method should
# return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

# Examples:

=begin

input: array
output: integer

rules:
- return an integer representing the number of times the block returns true
- cannot use Array#count or Enumerable#count

algorithm:
- initialize a new counter variable, set to 0
- iterate over the array with each
  - increment the counter every time the block returns true
- return the counter

=end

def count(array)
  counter = 0
  array.each { |el| counter += 1 if yield(el) }
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2