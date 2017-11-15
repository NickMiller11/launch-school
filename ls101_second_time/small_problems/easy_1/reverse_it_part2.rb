# Write a method that takes one argument, a string containing one or 
# more words, and returns the given string with all five or more letter 
# words reversed. Each string will consist of only letters and spaces. 
# Spaces should be included only when more than one word is present.

=begin

input: string
output: string

rule:
- reverse any words in a string that have 5 or more letters

algorithm:
- use split to convert to array
- use map to iterate
- reverse any string of 5 or more characters
- join it back to a string

- manual loop

=end

def reverse_words1(str)
  str.split.map { |word| word.size >= 5 ? word.reverse : word}.join(' ')
end

def reverse_words2(str)
  arr = str.split
  counter = 0
  loop do
    break if counter == arr.size
    current_word = arr[counter]
    current_word.reverse! if current_word.length >= 5
    counter += 1
  end
  arr.join(' ')
end



puts reverse_words1('Professional')          # => lanoisseforP
puts reverse_words1('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words1('Launch School')         # => hcnuaL loohcS

puts reverse_words2('Professional')          # => lanoisseforP
puts reverse_words2('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words2('Launch School')         # => hcnuaL loohcS