# Write a method that takes one argument, a positive integer, and 
# returns a string of alternating 1s and 0s, always starting with 1. 
# The length of the string should match the given integer.

=begin

input: positive integer
output: string

rules:
- return a string of alternating 1's and 0's, starting at 1
- length of string matches integer input

algorithm:
- use the times method, pushing values to array and alternate based on index
- join back to a string

- use a loop, true and false to toggle alternating

=end

require "pry"

def stringy1(int)
  arr = []
  final_str = []
  int.times do
    arr << 1
  end
  arr.each_with_index { |_num, i| i.even? ? final_str << 1 : final_str << 0 }
  final_str.join
end

def stringy2(int)
  arr = []
  toggle = true
  loop do
    break if arr.size == int
    if toggle == true
      arr << 1
    else
      arr << 0
    end
    toggle = !toggle
  end
  arr.join
end


puts stringy1(6) == '101010'
puts stringy1(9) == '101010101'
puts stringy1(4) == '1010'
puts stringy1(7) == '1010101'

puts stringy2(6) == '101010'
puts stringy2(9) == '101010101'
puts stringy2(4) == '1010'
puts stringy2(7) == '1010101'