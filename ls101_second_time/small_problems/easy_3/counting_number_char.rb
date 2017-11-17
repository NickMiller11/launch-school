# Write a program that will ask a user for an input of a word or multiple words 
# and give back the number of characters. Spaces should not be counted as a character.

# input:

# Please write word or multiple words: walk
# output:

# There are 4 characters in "walk".
# input:

# Please write word or multiple words: walk, don't run
# output:

# There are 13 characters in "walk, don't run".

=begin

input: string from user input 
output: integer 

Rules:
- get user input
- print number of characters (minus spaces)

Algorithm:
- collect user input string and assign to a variable
- remove spaces with gsub
- use length method to get number of characters
- print number of characters to screen

=end

puts "Please write word or multiple words:"
str = gets.chomp
output = str.gsub(' ','')
puts "There are #{output.length} characters in \"#{str}\"."