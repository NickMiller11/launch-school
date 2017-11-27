# Write a method that takes a non-empty string argument, and returns the
# middle character or characters of the argument. If the argument has an
# odd length, you should return exactly one character. If the argument has
# an even length, you should return exactly two characters.

=begin

Input: string
Output: string

Rules:
- if length of input string is odd, return 1 middle character
- if length of input string is even, return 2 middle characters

Algorithm:
- use String#length for flow control based on if even or odd
- if even
  - return length / 2 and length / 2 - 1
- if odd
  - return length / 2 - 1
=end

def center_of(str)
  size = str.length
  if size.odd?
    str[size/2]
  else
    str[size/2 - 1..size/2]
  end
end



p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
