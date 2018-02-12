# In the previous 3 exercises, you developed methods called any?, all?, and none?
# that are similar to the standard Enumerable methods of the same names.
# In this exercise, you will develop one last method from this family, one?.

# Enumerable#one? processes elements in a collection by passing each element
# value to a block that is provided in the method call. If the block returns
# a value of true for exactly one element, then #one? returns true. Otherwise,
# #one? returns false. Note in particular that #one? will stop searching the
# collection the second time the block returns true.

# Write a method called one? that behaves similarly for Arrays. It should take
# an Array as an argument, and a block. It should return true if the block
# returns true for exactly one of the element values.
# Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block
# returns true a second time.

# If the Array is empty, one? should return false,
# regardless of how the block is defined.

# Your method may not use any standard ruby method that is named all?, any?,
# none?, or one?.

=begin

input: array, block
output: boolean

rules:
- return true if block returns true from only one element
- stop iteration upon second true from yielding to block
- return block if empty array

algorithm:
- create a symbol toggle variable
- use each to iterate over the array
- toggle the symbol if yielding to the block returns true
- use a ternary conditional to return true or false depending on toggle status

=end

def one?(arr)
  only_one = false

  arr.each do |el|
    if yield(el) && only_one == false
      only_one = true
    elsif yield(el) && only_one == true
      only_one = false
      break
    end
  end
  only_one
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false