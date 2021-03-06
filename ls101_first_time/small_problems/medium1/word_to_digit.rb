# Write a method that takes a sentence string as input,
# and returns the same string with any sequence of the
# words 'zero', 'one', 'two', 'three', 'four', 'five',
# 'six', 'seven', 'eight', 'nine' converted to a string of digits.

=begin

input: string
output: string
data structure: hash

- first, create a hash that has the written number as a key with the
numerical value as the value
- split the string into an array
- iterate over the array, checking to see if the written number comes up and
replacing those values with the numerical values, otherwise just returning the
word as is

=end

require "pry"

NUMBERS = {'zero'=>0, 'one'=>1, 'two'=>2, 'three'=>3, 'four'=>4, 'five'=>5,
  'six'=>6, 'seven'=>7, 'eight'=>8, 'nine'=>9 }

DIGIT_HASH = {'zero'=>'0', 'one'=>'1', 'two'=>'2', 'three'=>'3', 'four'=>'4',
  'five'=>'5', 'six'=>'6', 'seven'=>'7', 'eight'=>'8', 'nine'=>'9' }.freeze

def word_to_digit(str)
  arr = str.split(' ')
  arr.map! do |val|
    if NUMBERS.keys.include?(val.gsub(/[^a-z]/, ''))
      val = NUMBERS[val.gsub(/[^a-z]/, '')]
      # binding.pry
    else
      val
    end
  end
  arr.join(' ')
end

def word_to_digit_ls(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end


p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit_ls('Please call me at five five five one two three four. Thanks.') #==
#'Please call me at 5 5 5 1 2 3 4. Thanks.'
