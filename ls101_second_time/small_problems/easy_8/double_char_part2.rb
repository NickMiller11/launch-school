# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.

=begin

Input: string
Output: string

Rules:
- return a string that doubles every consonant

Algorithm:
- we can use the same method as last time, modified with flow control

=end

def double_consonants(str)
  result = ''
  str.each_char do |char|
    if 'aeiouAEIOU'.include?(char) || char.match(/[^a-z]/i)
      result << char
    else
      result << char << char
    end
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
