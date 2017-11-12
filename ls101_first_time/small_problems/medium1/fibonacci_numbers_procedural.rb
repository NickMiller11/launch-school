# In the previous exercise, we developed a recursive solution to 
# calculating the nth Fibonacci number. In a language that is not 
# optimized for recursion, some (not all) recursive methods can be 
# extremely slow and require massive quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed 
# for heavy recursion; as a result, the Fibonacci solution is only useful up 
# to about fibonacci(40). With higher values of nth, the recursive solution is 
# impractical. (Our tail recursive solution did much better, but even that 
# failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive 
# (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results 
# without recursion.

=begin

Input: integer
Output: integer
Algorithm:

This will be easiest for me to accomplish in a loop/

Looping construct:
I'm going to use an array to collect my values, so I will initialize an array
with value [0, 1].  I will loop and add values array[-1] and array[-2] together 
and push these to the array.  I will have the loop break once the array reaches
a size of n.  I will then return the last value of the array.

=end

require 'pry'

def fibonacci(n)
  arr = [1, 1]
  loop do 
    arr << arr[-1] + arr[-2]
    break if arr.size == n
  end
  # binding.pry
  arr[-1]
end

p fibonacci(12)
p fibonacci(20) == 6765
p fibonacci(100)#== 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501