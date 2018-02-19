# Write a program that, given a word and a list of possible anagrams,
# selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like
# "enlists" "google" "inlets" "banana" the program should return a list
# containing "inlets". Please read the test suite for exact rules of anagrams.

=begin

input: array
output: array

rules:
  - for a given word that is an ivar of an Anagram object, use the match
    method to return an array containing any anagrams of the given word from
    the input array

algorithm:
  - I can probably do this by tallying up the letters and quantity of their
    occurance.
  - I need to first create a hash and tally up the letters
  - Then I need to create another tally with the letters of each word in the
    input array
  - then I add the input word only if the tally matches the tally of the ivar

=end

class Anagram
  attr_reader :main_word, :tally

  def initialize(word)
    @main_word = word.downcase
    @tally = create_tally(word.downcase)
  end

  def match(array)
    anagrams = []
    array.each do |word|
      next if main_word == word.downcase
      anagrams << word if anagram?(word.downcase)
    end
    anagrams
  end

  private

  def create_tally(word)
    word.chars.each_with_object({}) do |letter, hash|
      if hash[letter]
        hash[letter] += 1
      else
        hash[letter] = 1
      end
    end
  end

  def anagram?(word)
    test_tally = create_tally(word)
    tally == test_tally
  end
end

=begin

Notes after doing the exercise:
- I could have done this with a sorted array, didn't need to make it complicated
  with a hash

- I can try adding a step between writing out the algorithm and actually coding
  by writing out the code I want to work, and then work on implementing it

  For example:

    def match(words)
      words.select {|word| anagram?(word, @word)}
    end

  There is no anagram? method written yet, but that's how he wants it to work

- Try using the select method more rather than creating a new array and pushing
  applicable values to the new array.

- Easiest solution (from video)

  Class Anagram
    def initialize(word)
      @word = word
    end

    def match(words)
      words.select {|word| anagram?(word, @word)}
    end

    private

    def anagram?(word1, word2)
      return false if word1.downcase == word2.downcase
      word1.downcase.chars.sort == word2.downcase.chars.sort
    end
  end

- Code interviews will often ask you to solve a coding problem without using
  a convenient method.  For example, the presenter on the video is asking the
  students to solve the problem above without using sort (which I incidentally
  did)


=end