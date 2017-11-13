# The method below counts from 0 to 4. Modify the block so that it prints the
# current number and stops iterating when the current number equals 2.

=begin

Input: Integer
Output: Print integers to screen

Rules:
- stop iteration when number equals 2

Algorithm:
- add a puts statement to print the current integer to the screen
- add a break statement


=end

# Solution 1

5.times do |index|
  break if index > 2
  puts index
end

# Solution 2

5.times do |index|
  puts index if index < 3
end
