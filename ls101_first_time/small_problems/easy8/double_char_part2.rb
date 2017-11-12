# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.

CONSONANTS = 'bcdfghjklmnpqrstvwxyz'

def double_consonants(str)
  final = ''
  str.each_char { |c| CONSONANTS.include?(c.downcase) ? final << c * 2 : final << c }
  final
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
