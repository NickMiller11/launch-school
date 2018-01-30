# The Range#step method lets you iterate over a range of values where each
# value in the iteration is the previous value plus a "step" value.
# It returns the original range.

# Write a method that does the same thing as Range#step, but does not
# operate on a range. Instead, your method should take 3 arguments:
# the starting value, the ending value, and the step value to be applied
# to each iteration. Your method should also take a block to which it will
# yield (or call) successive iteration values.

# Example:

# step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# What do you think would be a good return value for this method, and why?

=begin

input: 3 integers
output: array of stepped integers

rules:
- iterate over all values between int1 and int2, using step int3
- pass each value into the block
- return a new array of values

algorithm:
- initialize a new return array
- initialize a new counter, set to int3
- loop do
  - yield int1 to block
  - add int1 to return array
  - increment by int3
  - break if greater than int2
- end
- return array

=end

def step(int1, int2, int3)
  results = []
  value = int1
  loop do
    yield(value)
    results << value
    value += int3
    break if value > int2
  end
  results
end

p step(1, 10, 3) { |value| puts "value = #{value}" }