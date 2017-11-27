# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on. Since multiple
# substrings will occur at each position, the substrings at a given position
# should be returned in order from shortest to longest.
#
# You may (and should) use the substrings_at_start method you wrote in the
# previous exercise:

=begin

Input: string
Output: array of strings

Rules:
- return an array containing all substrings of a string
- array should be sorted by where in the string the substring starts

Algorithm:
- call each_char on input string
- use sum_of_sums method on each character
- return result array

=end

require "pry"

def substrings_at_start(str)
  result_arr = []
  0.upto(str.size-1) do |num|
    result_arr << str[0..num]
  end
  result_arr
end

def substrings(str)
  final_arr = []
  loop do
    final_arr << substrings_at_start(str)
    str.delete!(str.chr)
    break if str.empty?
    # binding.pry
  end
  final_arr.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
