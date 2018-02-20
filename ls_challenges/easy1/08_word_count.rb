# Write a program that given a phrase can count the occurrences of each
# word in that phrase.
#
# For example, if we count the words for the input "olly olly in come free",
# we should get:
#
# olly: 2
# in: 1
# come: 1
# free: 1

=begin

input: string
output: hash

rules:
- return a hash that counts each word in the input string
- ignore punctuation

algorithm:
- prepare the string by removing any
- split the string into an array and use #each_with_object to iterate through
  the array and assign values

=end

class Phrase

  def initialize(words)
    @words = words
  end

  def word_count
    words_arr = prepare_string(@words)
    words_arr.each_with_object({}) do |word, hash|
      if hash.keys.include?(word)
        hash[word] += 1
      else
        hash[word] = 1
      end
    end
  end

  private

  def prepare_string(words)
    words.downcase.scan(/[\w']+/)
  end
end
