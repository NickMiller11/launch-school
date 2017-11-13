# Given the array below, use loop to remove and print each name.
# Stop the loop once names doesn't contain any more elements.

# names = ['Sally', 'Joe', 'Lisa', 'Henry']
# Keep in mind to only use loop, not while, until, etc.

=begin

Input: array
Output: print strings to screen

Rules:
- use a loop to remove and print each string in array
- break loop when array is empty

Algorithm:
- create a loop
- break if array is empty
- pop a string and print to screen

=end

# Solution 1

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  break if names.empty?
  puts names.pop
end

puts "--------"

# Solution 2

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  break if names.size == 0
  puts names.shift
end
