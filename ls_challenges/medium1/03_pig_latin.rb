# Pig Latin is a made-up children's language that's intended to be confusing.
# It obeys a few simple rules (below), but when it's spoken quickly it's really
# difficult for non-children (and non-native speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of
# the word.

# Rule 2: If a word begins with a consonant sound, move it to the end of the
# word, and then add an "ay" sound to the end of the word.

# There are a few more rules for edge cases, and there are regional variants too.

=begin

input: string
output: string

rules:
- if input word starts with a vowel or y, add 'ay' to the end of the word

- if input word starts with a consonant, move all consonents until the first vowel
  to the end of the word, then add 'ay' to the end of the word

- be able to handle a phrase

- account for special cases
  - if word starts with qu -> move qu to end
  - if word starts with ye -> move just the y
  - if word starts with yt -> just add 'ay' to end
  - if word starts with xe -> move just the x
  - if word starts with xr -> just add 'ay' to end

algorithm:


- break the original word into an array
- check first letter
  - if first letter is a consonant, shift and push to end
- add 'ay' to end
- join

=end

require 'pry'

class PigLatin
  def self.translate(original_word)

    phrase = original_word.split(' ')

    phrase.map! do |word|
      move_to_back = /\b[^aeiou]+/.match(word).to_s

      if /\b.*qu/.match(word)
        qu_case = /\b.*qu/.match(word).to_s
        word.gsub!(qu_case, '')
        word << qu_case
      elsif /\byt/.match(word) || /\bxr/.match(word)
        word << "ay"
        break
      elsif move_to_back != nil
        word.gsub!(move_to_back, '')
        word << move_to_back
      end

      word << "ay"
    end
    phrase.join(' ')
  end
end


# class PigLatin
#   VOWELS = %w(a e i o u)

#   def self.translate(original_word)
#     phrase = original_word.split(' ')

#     phrase.map! do |word|
#       word_translation(word)
#     end

#     phrase.join(' ')
#   end

#   private

#   def self.word_translation(word)
#     arr = word.chars

#     arr.map.with_index do |letter, index|
#       if letter == "q"
#         arr[index] = "qu"
#         arr.delete_at(index + 1)
#       end
#     end

#     until VOWELS.include?(arr[0]) do
#       break if arr[0] == "y" && arr[1] == "t"
#       break if arr[0] == "x" && arr[1] == "r"
#       arr << arr.shift
#     end

#     arr.push('ay').join('')
#   end

# end

p PigLatin.translate('chair')
p PigLatin.translate('queen')