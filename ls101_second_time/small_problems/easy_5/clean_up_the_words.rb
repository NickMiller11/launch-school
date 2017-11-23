# Given a string that consists of some words and an assortment of
# non-alphabetic characters, write a method that returns that string
# with all of the non-alphabetic characters replaced by spaces. If one or
# more non-alphabetic characters occur in a row, you should only have one
# space in the result (the result should never have consecutive spaces).

=begin

Input: string
Output: string with non-alphabetic characters replaced by spaces

Rules:
- return a string with all non-alphabetic characters replaced by spaces
- if there are multiple non-alphabetic characters in a row, return only 1 space
  - for the cluster

Algorithm:
- use gsub to replace anything not an alphanumeric character with a space
- use squeeze to remove unneccessary spaces

=end

def cleanup(str) # with regex
  str.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

ALPHANUMERIC = 'abcdefghijklmnopqrstuvwxyz1234567890 '

def cleanup2(str) # without regex
  new_arr = str.chars.map do |char|
    if ALPHANUMERIC.include?(char)
      char
    else
      char = ' '
    end
  end
  new_arr.join('').squeeze(' ')
end



p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup2("---what's my +*& line?") == ' what s my line '
