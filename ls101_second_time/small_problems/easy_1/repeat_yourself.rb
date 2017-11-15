# Write a method that takes two arguments, a string and a positive
# integer, and prints the string as many times as the integer indicates.

# Example:
#
# repeat('Hello', 3)
#
# Output:
#
# Hello
# Hello
# Hello

=begin

Input: string, positive integer
Output: string printed integer number of times

Algorithm:
- use times and puts methods to print the string

=end

def repeat(str, int)
  int.times do
    puts(str)
  end
end

repeat('Hello', 3)
