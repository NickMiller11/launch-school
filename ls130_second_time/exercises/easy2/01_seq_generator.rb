# The Range#step method lets you iterate over a range of values where
# each value in the iteration is the previous value plus a "step" value.
# It returns the original range.

# Write a method that does the same thing as Range#step, but does not
# operate on a range. Instead, your method should take 3 arguments:
# the starting value, the ending value, and the step value to be applied
# to each iteration. Your method should also take a block to which it will
# yield (or call) successive iteration values.

=begin

input: 3 integers, block
output: output value of block

rules:
- iterage over range between and including start_num and end_num
- yield elements to the block

algorithm:
- initialize counter as start_num
- while counter <= end_num
  - yield el to block
  - counter plus equals step_value


=end

def step(start_num, end_num, step_value)
  counter = start_num
  while counter <= end_num do
    yield(counter)
    counter += step_value
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# A good return value for this method would be to return the last element passed
# into the block