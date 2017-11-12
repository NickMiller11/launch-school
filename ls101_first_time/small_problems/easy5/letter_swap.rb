# Given a string of words separated by spaces, write a method
# that takes this string of words and returns a string in which
# the first and last letters of every word is swapped.

# You may assume that every word contains at least one letter,
# and that the string will always contain at least one word.
# You may also assume that each string contains nothing but words and spaces

def swap(string)
  arr = string.split(' ')
  arr.map { |word| word[0], word[-1] = word[-1], word[0] }
  arr.join(' ')
end

# Input: string
# Data Structure: array
# Output: string

# Split the string up into an array with each value being a word
# Exchange the first and last index of each word using parallel assignment


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
