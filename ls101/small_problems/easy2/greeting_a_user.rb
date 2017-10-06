# Write a program that will ask for user's name.
# The program will then greet the user. If the user
# writes "name!" then the computer yells back to the user.

puts("What is your name?")
name = Kernel.gets().chomp()
caps_name = name.upcase!


if name.include?("!")
  puts("HELLO #{caps_name.chop}. WHY ARE WE SCREAMING?")
else
  puts("Hello #{name}.")
end
