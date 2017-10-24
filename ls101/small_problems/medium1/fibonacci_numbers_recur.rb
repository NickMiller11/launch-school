# The Fibonacci series is a sequence of numbers starting with 1 and 1 
# where each number is the sum of the two previous numbers: the 3rd Fibonacci 
# number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. 
# In mathematical terms:

# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
# Sequences like this translate naturally as "recursive" methods. 
# A recursive method is one in which the method calls itself. For example:

# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end
# sum is a recursive method that computes the sum of all integers between 1 and n.

# Recursive methods have three primary qualities:

# They call themselves at least once.
# They have a condition that stops the recursion (n == 1 above).
# They use the result returned by themselves.

# In the code above, sum calls itself once; it uses a condition of n == 1 to 
# stop recursing; and, n + sum(n - 1) uses the return value of the recursive
# call to compute a new return value.

# Write a recursive method that computes the nth Fibonacci number, where nth is
# an argument to the method.

=begin

Input: integer
Output: integer
Algorithm: I am calling a method that calculates the sum of the previous two
numbers in the sequence by calling itself.

I need to first create a break statement that breaks if n = 2
Then I should create return statements for edge cases n = 1
I should then use the method to call itself twice, adding the values together.
One should be called with argument n-1 and the other should be called with 
argument n-2.  By not assigning the result to a variable, the method should return 
the final sum as the last evaluated expression

=end

def fibonacci(int)
  if int == 1 || int == 2
    1
  else 
    fibonacci(int-2) + fibonacci(int-1)
  end
end

  
p fibonacci(1) #== 1
p fibonacci(2) #== 1
p fibonacci(3) #== 2
p fibonacci(4) #== 3
p fibonacci(5) #== 5
p fibonacci(12) #== 144
p fibonacci(20) #== 6765