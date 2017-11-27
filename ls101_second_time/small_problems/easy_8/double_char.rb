# Write a method that takes a string, and returns a new string in which every
# character is doubled.

=begin

Input: string
Output: string

Rules:
- return a string with each character from the input string duplicated

Algorithm:
- initialize a new local variable for result
- use String#each_char on the input string
- push each char to result variable twice
- return result variable

=end

def repeater(str)
  result = ''
  str.each_char do |char|
    result << char << char
  end
  result
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
