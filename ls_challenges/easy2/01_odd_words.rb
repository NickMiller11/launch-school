=begin

how to work on a coding problem
- don't underestimate; resist the urge to dive into code
- read the description 3 times; produce an outline if necessary
- communicate and clarify
- have a plan (algorithm), and verify with that
- test cases
  - happy paths (most obvious examples)
  - fail paths (certain inputs/data that need to produce failures
  - edge cases ("what happens if...", inputs still valid but unusual)
    - for example, if code is supposed to handle input from 0 to 100, make
      sure to test both 0 and 100
- manage your energy
- think of abstractions, abstract different parts of the problem away
  - allows you to think about one piece of the problem at a time

Problem:

Consider a character set consisting of letters, a space, and a point.  Words
consist of one or more, but at most 20 letters.  An input text consists of one
or more words separated from each other by one or more spaces and terminated by
0 or more spaces followed by a point.  Input should be read from, and including,
the first letter of the first word, up to and including the terminating point.
The output text is to be produced such that successive words are separated by a
single space with the last word being terminated by a single point.  Odd words
are copied in reverse order while even words are merely echoed.  For example,
the input string

"whats the matter with kansas." becomes "whats eht matter htiw kansas."

BONUS POINTS: the characters must be read and printed one at a time.

input: string
output: string

rules:
- input string has letters, space, and point
- words are 1-20 letters
- input string has one or more words with one or more spaces in between
- last word has 0 or more spaces and then a point
- input string should be read from first character to last point
- output text should have words separated by a single space
- the last word should have no spaces after it, just a point
- odd words are copied in reverse order
- read input char by char and produce output char by char

algorithm:
- split the string into an array
- iterate over the array with #each_with_index
- reverse the strings that have an odd index
- print the words as they are iterated over

=end

require 'pry'

class Oddwords
  def initialize(string)
    @string = string
  end

  def convert
    arr = @string.split(' ')
    arr.each_with_index { |word, index| word.reverse! if index.odd? }
    fix_last_period(arr)
    arr.join(' ')
  end

  private

  def fix_last_period(arr)
    arr[-1] == "." ? arr.pop : arr[-1].delete!(".")
    arr[-1].insert(-1, '.')
  end

end

test = Oddwords.new("whats the matter now with kansas.")
p test.convert



