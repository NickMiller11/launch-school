# Write a method that takes a positive integer as an argument and
# returns that number with its digits reversed

=begin

Input: int
Output: int

Rules:
- input is a positive integer
- return an integer that is reversed

Algorithm:
- convert the integer into a string, convert to array, reverse, join, and convert
to integer

=end

def reversed_number(int)
  int.to_s.chars.reverse.join('').to_i
end



p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
