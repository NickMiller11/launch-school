# Write a method that takes a string argument and returns a new string
# that contains the value of the original string with all consecutive
# duplicate characters collapsed into a single character.
# You may not use String#squeeze or String#squeeze!.

# Note - the below does NOT work.  Wasn't able to get this one.

def crunch(string)
  counter = 0
  prev_counter = -1

  final_array = []

  loop do
    current_char = string[counter]
    previous_char = string[prev_counter]

    break if counter == string.length
    next if current_char == previous_char
      final_array << current_char
    counter += 1
    prev_counter += 1
  end
  p final_array.join
end

# Input: string
# Data structure: loop
# Output: string

# One idea is I can put this into a loop where it goes to the next line
# if the previous charcter is equal to the current character

# Here is the solution from LS

def crunch(text)
  index = 0
  crunch_text = ''

  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') #== 'a'
p crunch('') #== ''

# return '' if string == ''
# counter = 1
# current_char = string[counter]
# previous_char = string[counter-1]
#
# loop do
#   string.delete!(current_char) if current_char == previous_char
#   counter += 1
#   break if counter == string.length
# end
# string
# end
