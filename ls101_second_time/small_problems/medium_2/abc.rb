# A collection of spelling blocks has two letters per block, as 
# shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words 
# that do not use both letters from any given block. Each block can only 
# be used once.

# Write a method that returns true if the word passed in as an argument 
# can be spelled from this set of blocks, false otherwise.

=begin

Input: string
Output: boolean

Rules:
- check to see if the input string can be spelled using the blocks
- once a block has been used, it cannot be used again.

Algorithm:
- represent the blocks as a nested array
- iterate through letters
- iterate through blocks, check to see if letter is available
  - if letter is available, delete that subarray

=end

def block_word?(str)
  final_word = ''
  blocks = [
           ['B','O'], ['X','K'], ['D','Q'], ['C','P'], ['N','A'], 
           ['G','T'], ['R','E'], ['F','S'], ['J','W'], ['H','U'],
           ['V','I'], ['L','Y'], ['Z','M']
           ]  
  arr = str.upcase.chars
  arr.each do |letter|
    blocks.each do |block|
      if block.include?(letter)
        final_word << letter
        blocks.delete(block)
      end
    end
  end
  final_word.upcase == str.upcase
      
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true