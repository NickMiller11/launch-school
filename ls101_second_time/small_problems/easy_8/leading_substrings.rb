# Write a method that returns a list of all substrings of a string that
# start at the beginning of the original string. The return value should
# be arranged in order from shortest to longest substring.

=begin

Input: string
Output: array of strings

Rules:
- return all consectutive substrings from string into an array
- sort substrings from shortest to longest

Algorithm:
- initialize a new local variable for result array
- use upto method to pass in numbers that could be indexes
- push substrings to new array

=end

def substrings_at_start(str)
  result_arr = []
  0.upto(str.size-1) do |num|
    result_arr << str[0..num]
  end
  result_arr
end


p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
