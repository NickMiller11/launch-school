# Write a program that, given a word, computes the scrabble score for that word.

# Letter Values

# You'll need these:

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

# Examples
# "cabbage" should be scored as worth 14 points:

# 3 points for C
# 1 point for A, twice
# 3 points for B, twice
# 2 points for G
# 1 point for E

# And to total:

# 3 + 2*1 + 2*3 + 2 + 1
# = 3 + 2 + 6 + 3
# = 5 + 9
# = 14

=begin

input: string
output: integer

rules:
- compute the score for a particular scrabble word
- return 0 for empty string, whitespace, and nil
- word is case insensitive

algorithm:
- create a hash for letters and cooresponding scores
- create a guard clause for invalid input
- break up input string into array
- iterate through array, looking up value for letter
- reduce the score to sum up
- return the score

=end

class Scrabble
  LETTER_POINTS = {
    %w(a e i o u l n r s t) => 1,
    %w(d g) => 2,
    %w(b c m p) => 3,
    %w(f h v w y) => 4,
    %w(k) => 5,
    %w(j x) => 8,
    %w(q z) => 10
  }

  def initialize(word)
    @word = word
  end

  def score
    score = 0
    return score if @word == nil

    letters = @word.downcase.split('')
    letters.each do |letter|
      LETTER_POINTS.each do |key, value|
        score += LETTER_POINTS[key] if key.include?(letter)
      end
    end
    score
  end

  def self.score(word)
    score = 0
    return score if word == nil

    letters = word.downcase.split('')
    letters.each do |letter|
      LETTER_POINTS.each do |key, value|
        score += LETTER_POINTS[key] if key.include?(letter)
      end
    end
    score
  end

  # this class method could be written as:
  # def self.score(word)
      # new(word).score
  # end

end

=begin

Notes from video:
- don't necessarily need to create an array of letters in the Score hash.
  I could use strings of the letters since #include? would still return a match

- Good student solution

  def intialize word
    @word = word.to_s.upcase
  end

  def score
    @word.each_char.inject(0) { |sum, letter| sum + points(letter) }
  end

  def self.score word
    new(word).score
  end

  private

  def points letter
    case letter
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' then 1
    when ......
    else                                                  then 0
    end
  end

- inject or reduce is essentially map, you can iterate over non-integer items
  as well (like the student solution above)

- can use Hash.new(0) to return 0 for anything not an existing key (for first
  three tests)

=end
