# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout the
# natural world.
#
# Computationally, the Fibonacci series is a very simple series, but the results
# grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
# 354,224,848,179,261,915,075 -- that's enormous, especially considering that it
# takes 6 iterations before it generates the first 2 digit number.
#
# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
#   Fibonacci number has index 1.)

=begin

Input: Integer
Output: Integer

Rules:
- return index where first number of input length appears

Algorithm:
- Use a loop to calculate Fib number
- Push result to array
- Compare result length vs input (to_s + length)
- Return index if it meets the criterea (starting at 1)

=end

def find_fibonacci_index_by_length(size)
  num1 = 1
  num2 = 1
  temp_num = 0
  fib_array = [num1, num2]
  loop do
    temp_num = num2
    num2 += num1
    num1 = temp_num
    fib_array << num2
    break if num2.to_s.size == size
  end
  fib_array.index(num2) + 1
end


p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
