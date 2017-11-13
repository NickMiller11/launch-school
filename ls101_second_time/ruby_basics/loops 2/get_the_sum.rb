# The code below asks the user "What does 2 + 2 equal?" and uses #gets to
# retrieve the user's answer. Modify the code so "That's correct!" is printed
# and the loop stops when the user's answer equals 4. Print "Wrong answer.
# Try again!" if the user's answer doesn't equal 4.

=begin

Input: Input from user
Output: Print statement to screen

Rules:
- Ask user for Input
- print statement to screen if input equals 4
- create a loop and print separate statement to screen if input doesn't equal 4
- stop loop once the input equals 4

Algorithm:
- create if statement inside loop to compare if input equals 4
- print statement to screen if input equals 4 and break the loop
- else, print separate statement


=end

# Solution 1

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts("That's correct!")
    break
  else
    puts("Try again!")
  end
end

# Solution 2

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  answer == 4 ? break : puts("Try again!")
end
puts("That's correct!")
