# Write a loop that prints numbers 1-5 and whether the number is even or odd.
#  Use the code below to get started.

# count = 1

# loop do
#   count += 1
# end

# Expected output:

# 1 is odd!
# 2 is even!
# 3 is odd!
# 4 is even!
# 5 is odd!

=begin

Input: N/A
Output: Printing Integers to screen

Rules:
- print integers 1-5 to screen, indicating whether they are even or odd

Algorithm:
- add a break statement to break after integer 5 is printed to screen
- add an if conditional using a modulo
- add a print method to print the numbers to the screen

=end

count = 1

loop do
  break if count > 5
  count % 2 == 0 ? puts("#{count} is even!") : puts("#{count} is odd!")
  count += 1
end

puts "------"

count = 1

loop do
  break if count > 5
  if count % 2 == 0
    puts("#{count} is even!")
  else
    puts("#{count} is odd!")
  end
  count += 1
end
