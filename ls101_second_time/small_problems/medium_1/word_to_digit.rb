# Write a method that takes a sentence string as input, and returns the same 
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

=begin

Input: string (with numbers as words)
Output: strings (with numbers as digits)

Rules:
- return the input string with numbers as words replaced with digits

Algorithm:
- create hash of numbered words
- split the string into an array
- iterate through the string, placing numbered words with index number
- join the array back into a string

=end

NUMBERS = %w(zero one two three four five six seven eight nine)

def word_to_digit(str)
  arr = str.split
  arr.map! do |word|
    
    if NUMBERS.include?(word) 
      NUMBERS.index(word)
    elsif NUMBERS.include?(word[0..-2])
      NUMBERS.index(word[0..-2])
    else
      word
    end
  end
  arr.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') 