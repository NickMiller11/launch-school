# Write a program that will ask a user for an input of a
# word or multiple words and give back the number of characters.
# Spaces should not be counted as a character.

puts("Please write a word of multiple words:")
user_str = Kernel.gets().chomp()
puts("There are #{user_str.tr(' ', '').length} characters in \"#{user_str}.\"")
