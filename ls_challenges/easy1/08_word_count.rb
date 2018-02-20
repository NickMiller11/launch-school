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

#LS Solution

class Phrase
  def initialize(phrase)
   @words = phrase.split(/[\s,]/)
                  .select { |word| word.match(/[a-zA-Z0-9]/) } # also match.(/[[[:alnum:]]]/)
                  .map { |word| transform_word(word) }
  # can also use - @words.scan(/\w+'?\w|\d+/) <-- what does this do??

  end

  def word_count
    summary = Hash.new(0)
    @words.each do |word|
      summary[word] += 1
    end
    summary
  end

  def transform_word(word)
    word.gsub(/[^a-zA-Z0-9']|^'|'$/, '').downcase
  end
end

# Very simple student solution

Class Phrase
  def initialize(sentence)
    @sentence = sentence.downcase.scan(/[a-z0-9']+/)
  end

  def word_count
    remove_quotes.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
  end

  private

  def remove_quotes
    @sentence.each { |word| word.gsub!(/^'|'$/, '')

=begin

- I had a lot of trouble with this one, I couldn't seem to get the Regex structured
  correctly...I was able to hit all the edge cases but the last one (apostrophe
  within words)

Notes from video:

- Look at the test cases first before I start coding to check all the requirements
  but don't worry about the edge cases at first

=end

# My first attempt

# class Phrase

#   def initialize(words)
#     @words = words
#   end

#   def word_count
#     words_arr = prepare_string(@words)
#     words_arr.each_with_object({}) do |word, hash|
#       if hash.keys.include?(word)
#         hash[word] += 1
#       else
#         hash[word] = 1
#       end
#     end
#   end

#   private

#   def prepare_string(words)
#     words.downcase.gsub(/[.,:;!@#$%\^&*\(\)]+('[^'])/, ' ').squeeze(' ').split(' ')
#   end
# end