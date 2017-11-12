# In the previous two exercises, you developed methods that convert
# simple numeric strings to signed Integers. In this exercise and the
# next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts
# it to a string representation.

# You may not use any of the standard conversion methods available in
# Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method
# should do this the old-fashioned way and construct the string by analyzing
# and manipulating the number.

DIGITS = {
  1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'
}

def integer_to_string(int)
  final_str = ''
  int.digits.each { |i| final_str.prepend(DIGITS[i]) }
  final_str
end


p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Input - Integer
# Data Structure - Hash
# Output - String

# Ended up using prepend for this one after trying << first.  << gave me
# everything in reverse because it would add to the end of the string.
