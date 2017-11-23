#
# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by
# adding the ability to represent negative numbers as well.
#
# Write a method that takes an integer, and converts it to a string representation.
#
# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. You may, however, use
# integer_to_string from the previous exercise.

=begin

Input: negative integer, positive integer, or 0
Output: string representation of integer with + or - signs

Rules:
- convert input integer into string
- add a + or - sign if positive or negative
- cannot use Integer#to_s, String(), or Kernel#format

Algorithm:
- use an case to check if number is positive, negative, or 0

=end

def integer_to_string(int)
  new_arr = []
  remaining_number = int
  loop do
    remaining_number, current_number = remaining_number.divmod(10)
    new_arr.unshift(current_number)
    break if remaining_number == 0
  end
  new_arr.join
end

def signed_integer_to_string(int)
  case
  when int > 0
    integer_to_string(int).prepend('+')
  when int < 0
    integer_to_string(int*-1).prepend('-')
  else
    integer_to_string(int)
  end
end


p signed_integer_to_string(4321) #== '+4321'
p signed_integer_to_string(-123) #== '-123'
p signed_integer_to_string(0) #== '0'
