# Write a program that will ask for user's name. The program will then greet the 
# user. If the user writes "name!" then the computer yells back to the user.

# Examples

# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

=begin

Input: User input 
Output: string

Rule:
- greet the user
- greet the user in all caps if user adds bang to end of input

Algorithm:
- Ask the user for their name
- ternary operator to change output strings

=end

# puts("What is your name?")
# name = gets.chomp
# name[-1] == "!" ? puts("HELLO #{name.upcase[0..-2]}. WHY ARE WE SCREAMING?") : puts("Hello #{name}.")


print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  puts "HELLO #{name.chop!.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end