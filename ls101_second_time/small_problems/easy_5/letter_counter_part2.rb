# Modify the word_sizes method from the previous exercise to
# exclude non-letters when determining word size. For instance,
# the length of "it's" is 3, not 4.

=begin

Input: string
Output: hash

Rules:
- return a hash with keys of word sizes and values of how many words of that size
  - are in the input string
- do not count any non-alphabetic characters

Algorithm:
- use gsub to remove any non-alphabetic characters using a regex
=end

require 'pry'

def word_sizes(str)
  size_hash = {}
  # binding.pry
  str.split.each do |word|
    word.gsub!(/[^a-z]/i, '')
    word_size = word.size
    if size_hash.keys.include?(word_size)
      size_hash[word_size] += 1
    else
      size_hash[word_size] = 1
    end
  end
  size_hash
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
