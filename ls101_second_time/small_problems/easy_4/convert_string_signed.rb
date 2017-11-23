# In the previous exercise, you developed a method that converts simple
# numeric strings to Integers. In this exercise, you're going to extend
# that method to work with signed numbers.
#
# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading + or - sign; if the
# first character is a +, your method should return a positive number; if
# it is a -, your method should return a negative number. If no sign is
# given, you should return a positive number.
#
# You may assume the string will always contain a valid number.
#
# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. You may, however, use the string_to_integer
# method from the previous lesson.



=begin

Input: string
Output: integer

Rules:
- convert the input string into an integer and return it
- cannot use String#to_i or Integer() methods

Algorithm:

=end

INTEGERS = {
  '0'=>0, '1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5,
  '6'=>6, '7'=>7, '8'=>8, '9'=>9
}

def string_to_integer(num_str)
  num_arr = []
  num_str.each_char { |char| num_arr << INTEGERS[char] }
  value = 0
  num_arr.each { |num| value = value * 10 + num }
  value
end

def string_to_signed_integer(num_str)
  with_sign = string_to_integer(num_str[1..-1])
  case num_str[0]
  when '-'
    -with_sign
  when '+'
    with_sign
  else
    string_to_integer(num_str)
  end
end

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100
