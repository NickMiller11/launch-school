# Modify the word_sizes method from the previous exercise to exclude
# non-letters when determining word size.
# For instance, the length of "it's" is 3, not 4.

def word_sizes(string)
  string.gsub!(/[^a-z ]/i, "")
  arr = string.split(' ')
  hsh = Hash.new(0)
  arr.each { |word| hsh[word.length] += 1 }
  hsh
end

# just like part 1, except I'm going to use that fancy pancy new regex to replace
# anything not an alphabetical character or a space with nothing (i.e., remove it).

# after checking the LS solution, it looks like we can use the delete
# method here too

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
