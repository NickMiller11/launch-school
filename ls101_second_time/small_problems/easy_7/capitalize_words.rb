# Write a method that takes a single String argument and returns a
# new string that contains the original value of the argument with
# the first character of every word capitalized and all other letters lowercase.
#
# You may assume that words are any sequence of non-blank characters.

=begin

Input: string
Output: string

Rules:
- return a string with:
  - 1. the first character of every word capitalized
  - 2. all other characters lowercase

Algorithm:
- split the string into an array
- use the each method, downcase, then capitalize

=end

require "pry"

def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

def word_cap2(str)
  arr = str.split.map! do |word|
    if word[0] =~ /[^a-z]/i
      word
    else
      word.downcase!
      word[0].upcase! + word[1..-1]
    end
  end
  arr.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

p word_cap2('four score and seven') == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'
