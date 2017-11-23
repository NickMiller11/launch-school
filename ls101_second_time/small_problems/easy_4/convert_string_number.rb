# The String#to_i method converts a string of numeric characters (including an
# optional plus or minus sign) to an Integer. String#to_i and the Integer
# constructor (Integer()) behave similarly. In this exercise, you will create
# a method that does the same thing.
#
# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.
#
# For now, do not worry about leading + or - signs, nor should you worry about
# invalid characters; assume all characters will be numeric.
#
# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. Your method should do this the old-fashioned
# way and calculate the result by analyzing the characters in the string.

=begin

Input: string
Output: integer

Rules:
- convert the input string into an integer and return it
- cannot use String#to_i or Integer() methods

Algorithm:
- initialize a new array
- use the each_char method on the input string
- multiply the char by itself
- split it into an array
- take the size of the array and pass it into the new array

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

p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570
