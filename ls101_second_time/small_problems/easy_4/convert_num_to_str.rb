# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're
# going to reverse those methods.
#
# Write a method that takes a positive integer or zero, and converts it to
# a string representation.
#
# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. Your method should do
# this the old-fashioned way and construct the string by analyzing and
# manipulating the number.

=begin

Input: positive integer or zero
Output: string representation of input

Rules:
- convert input integer into string
- cannot use Integer#to_s, String(), or Kernel#format

Algorithm:
- use modulo or division to isolate a number
- push the number to a new array
- join the array

=end

require "pry"

def integer_to_string(int)
  new_arr = []
  remaining_number = int
  loop do
    remaining_number, current_number = remaining_number.divmod(10)
    new_arr.unshift(current_number)
    break if remaining_number == 0
    # binding.pry
  end
  p new_arr.join
end

integer_to_string(4321) #== '4321'
integer_to_string(0) #== '0'
integer_to_string(5000) #== '5000'
