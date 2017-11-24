# Write a method that takes a string argument and returns a new string
# that contains the value of the original string with all consecutive
# duplicate characters collapsed into a single character. You may not use
# String#squeeze or String#squeeze!.

=begin

Input: string
Output: string

Rules:
- return a string that has all consecutive duplicate characters removed

Algorithm:
- use a transformation sequence to delete a character if it is the same
  - as the one in front of it

=end

def crunch(str)
  new_arr = []
  str.chars.map.with_index do |letter, index|
    next if letter == str[index + 1]
    new_arr << letter
  end
  new_arr.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
