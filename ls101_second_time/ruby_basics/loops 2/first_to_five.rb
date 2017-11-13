# The following code increments number_a and number_b by either 0 or 1.
# loop is used so that the variables can be incremented more than once, however,
# break stops the loop after the first iteration. Use next to modify the code so
# that the loop iterates until either number_a or number_b equals 5.
# Print "5 was reached!" before breaking out of the loop.

=begin

Input: N/A
Output: Print string to screen

Rules:
- change code so that string is printed after either variable reaches 5

Algorithm:
- add an OR conditional to the break statement

=end

# Solution 1 (not using next)

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  break if number_a == 5 || number_b == 5
end
puts "5 was reached!"

# Solution 2 (using next)

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5
  break
end
puts "5 was reached!"
