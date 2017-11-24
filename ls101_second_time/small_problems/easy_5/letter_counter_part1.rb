# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.
#
# Words consist of any string of characters that do not include a space.

=begin

Input: string
Output: hash

Rules:
- return a hash with keys of word sizes and values of how many words of that size
  - are in the input string

Algorithm:
- create a new hash
- split the string into an array
- iterate over the array
  - if the size of the word exists as a key in the hash, add 1 to the value
  - if not, add the size as a key with a value of one

=end

def word_sizes(str)
  size_hash = {}
  str.split.each do |word|
    word_size = word.size
    if size_hash.keys.include?(word_size)
      size_hash[word_size] += 1
    else
      size_hash[word_size] = 1
    end
  end
  size_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
