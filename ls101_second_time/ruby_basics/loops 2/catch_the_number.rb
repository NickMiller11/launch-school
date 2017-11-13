# Modify the following code so that the loop stops if number is between 0 and 10.

=begin

Input: N/A
Output: Print integers to screen, return nothing

Rules:
- print random numbers between 0-99 to the screen
- stop the loop when the last printed number is between 0-10

Algorithm:
- add a break statement that breaks if the number falls between 0-10

=end

loop do
  number = rand(100)
  puts number
  break if number.between?(0,10)
end

puts "------"

loop do
  number = rand(100)
  puts number
  break if number <= 10
end
