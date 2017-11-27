# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.

=begin

Input: string
Output: boolean

Rules:
- return true if all alphabetic characters in string are uppercase
- return false otherwise
- ignore non-alphabetic characters

Algorithm:
- iterate through each letter with String#each_char
- return false if a character does not equal char.upcase
- return true otherwise

=end

def uppercase?(str)
  str.each_char do |char|
    return false if char != char.upcase
  end
  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
