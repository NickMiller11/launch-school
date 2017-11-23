# Write a method that determines and returns the ASCII string value of a
# string that is passed in as an argument. The ASCII string value is the
# sum of the ASCII values of every character in the string. (You may use
# String#ord to determine the ASCII value of a character.)

=begin

Input: string
Output: integer

Rules:
- return the sum of the ASCII values of each character in the string

Algorithm:
- initialize a sum local variable, set equal to 0
- call each_char method on string
  - call ord method on each character
  - add value to sum
- return total sum

=end

def ascii_value(str)
  sum = 0
  str.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
