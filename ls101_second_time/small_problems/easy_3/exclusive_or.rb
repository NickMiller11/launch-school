# The || operator returns a truthy value if either or both of its 
# operands are truthy, a falsey value if both operands are falsey. 
# The && operator returns a truthy value if both of its operands are truthy,
# and a falsey value if either operand is falsey. This works great until you
# need only one of two conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a method named xor that takes two arguments, 
# and returns true if exactly one of its arguments is truthy, false otherwise.

=begin

Input: two booleans  
Output: boolean

Rule:
- return true if only one of the two inputs are true, false otherwise

Algorithm:
- create an or statement and statement that both do not equal true

=end


def xor?(input1, input2)
  (input1 || input2) && (input1 != input2) 
end


p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false