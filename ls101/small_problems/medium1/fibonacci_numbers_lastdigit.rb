# In the previous exercise, we developed a procedural method for
# computing the value of the nth Fibonacci numbers. This method
# was really fast, computing the 20899 digit 100,001st Fibonacci
# sequence almost instantly.
#
# In this exercise, you are going to compute a method that returns
# the last digit of the nth Fibonacci number.

=begin
Input: integer
Output: integer

This should be pretty easy.  I can use my method from the previous
exercise to get fibonacci's number.  I can then call Integer#digits to turn
that number into an array and then return the value at index -1.

=end

require 'pry'

def fibonacci_last(n)
  arr = [1, 1]
  loop do
    arr << arr[-1] + arr[-2]
    break if arr.size == n
  end
  arr[-1].digits[0]
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
