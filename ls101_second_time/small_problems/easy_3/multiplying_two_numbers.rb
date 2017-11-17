# Create a method that takes two arguments, 
# multiplies them together, and returns the result.

# Example:

# multiply(5, 3) == 15

=begin

Input: two numbers
Output: integer

Rules:
- return product of two input numbers

Algorithm:
- define a method that takes in two arguments
- multiply the arguments togther

=end

def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15
p multiply([5, 4], 3)