# Write a method that takes a string, and returns a new string
# in which every character is doubled.

CONSONANTS = 'bcdfghjklmnpqrstvwxyz'

def repeater(str)
  final = ''
  str.each_char { |c| final << c * 2 if CONSONANTS.include?(c) }
  final
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
