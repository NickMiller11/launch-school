# Given a string of words separated by spaces, write a method that takes
# this string of words and returns a string in which the first and last
# letters of every word is swapped.
#
# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

=begin

Input: string
Output: string with letters in each word reversed

Rules:
- reverse the letters in each word in the string

Algorithm:
- split the string into an array by spaces
- call reverse on each word
- join the array back together

=end

def swap(str)
  new_arr = str.split
  swapped_arr = new_arr.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  swapped_arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
