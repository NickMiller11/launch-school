# Using the multiply method from the "Multiplying Two Numbers" problem, 
# write a method that computes the square of its argument (the square 
# is the result of multiplying a number by itself).

def multiply(num1, num2)
  num1 * num2
end

def square(num1)
  a= multiply(num1, num1)
  multiply(a, num1)
end

p square(5) #== 25
p square(-8) #== 64
