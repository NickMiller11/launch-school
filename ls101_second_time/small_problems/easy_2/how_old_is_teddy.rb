# Build a program that randomly generates and prints Teddy's age. 
# To get the age, you should generate a random number between 20 and 200.

# Example Output

# Teddy is 69 years old!

=begin

input: n/a
output: string

rules:
- output a string with a random digit between 20 and 200

algorithm:
- use random format rand(20..200) to generate a random age

=end


puts("What is your name?")
name = gets.chomp
if name == ''
  puts("Teddy is #{rand(20..200)} years old!")
else
  puts("#{name} is #{rand(20..200)} years old!")
end
