# Given a string that consists of some words and an assortment
# of non-alphabetic characters, write a method that returns that
# string with all of the non-alphabetic characters replaced by spaces.

# If one or more non-alphabetic characters occur in a row, you should
# only have one space in the result (the result should never have consecutive spaces).

# NOTE: THE BELOW DOESN'T WORK

# require "pry"
#
# SYMBOLS = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '?', '+', '\'']
#
# def cleanup(string)
#   final_arr = []
#   counter = 0
#   char = string[counter]
#   last_char = string[counter-1]
#
#   loop do
#     break if counter == string.length
#
#     if SYMBOLS.include?(char) && last_char == ' '
#       final_arr << ''
#     elsif SYMBOLS.include?(char)
#       final_arr << ' '
#     else
#       final_arr << char
#     end
#     binding.pry
#     counter += 1
#
#   end
#   p final_arr.join('')
# end

# INPUT: string
# Data Structure: Array, using keep method
# OUTPUT: string

# Solution from LS...man, I really need to learn regular expressions

def cleanup(string)
  string.gsub!(/[^a-z]/i, " ").squeeze(" ")
end

p cleanup("---what's my +*& line?") #== ' what s my line '
