# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(string)
  arr = string.split(' ')
  hsh = {}
  arr.each { |word| hsh[word.length] = 0 }
  arr.each { |word| hsh[word.length] += 1 }
  hsh
end

# Input: string
# Data structure: Array
# Output: hash

# Separate into an array with each word as a value
# Take the length of that value and add it to the hash as a key
# Iterate through the array and add number of words with that length as a value in the hash


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
