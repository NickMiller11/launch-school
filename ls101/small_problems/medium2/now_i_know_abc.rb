

# A collection of spelling blocks has two letters per block, as shown in this list:
#
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
#
# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used once.
#
# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

=begin
Input: string
Data structure: nested array
Output: boolean

- My goal is to return a boolean if the word can be spelled from the list of blocks

- I am going to represent the blocks as a nested array.

- I need to set up a method to initialize a set of blocks based on that array,
then remove the blocks once they have been used.

- I need to ignore case

- I need to go letter by letter in the argument, so I'm going to turn the argument
into an array

- Once I have the argument as an array, I'm going to iterate through the blocks
looking for the letter of the argument.  If I find it, I will remove that block
and move on to the next letter.  If I don't, I will return false.  If all letters
have been iterated through, I will return true.

=end

require "pry"


def block_word?(word)
  blocks = [
  ['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'], ['G','T'], ['R','E'],
  ['F','S'], ['J','W'], ['H','U'], ['V','I'], ['L','Y'], ['Z','M']
]

  characters = word.upcase.chars
  block_word = ''
  characters.each do |letter|
    blocks.each do |block|
      if block.include?(letter)
        blocks.delete(block)
        block_word << letter
      end
    end
  end
  #binding.pry
  block_word == characters.join
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true