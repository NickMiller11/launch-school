# Write a method that takes a string, and returns a new string
# in which every character is doubled.

def repeater(str)
  final = ''
  str.each_char { |c| final << c * 2 }
  final
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
