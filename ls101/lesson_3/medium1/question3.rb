# Here is the original method

# def factors(number)
#   dividend = number
#   divisors = []
#   begin
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end until dividend == 0
#   divisors
# end

# How can you make this work without using begin/end/until?

# Ok, so when they say not to use begin/end/until, I'm not sure if they
# mean to not ADD any of those terms, or rewrite the method without them.
# Let's try both!

# Here is the method rewritten without adding any begin/end/until statements

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  rescue ZeroDivisionError
    puts "Please use a positive integer"
  end until dividend <= 0
  divisors
end

p factors(-5)
p factors(0)

# Here is the method rewritten without using any begin/end/until statements

def factors(number)
  dividend = number
  divisors = []
  loop do
    break if dividend <= 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

p factors(-5)
p factors(0)

# Bonus 1 - The purpose of number % dividend == 0 is to identify
# whole numbers, or integers, that are divisors of number / dividend.
# The modulus will find numbers that have no remainder when divided

# Bonus 2 - Writing 'divisors' means that will be the return value
# since it is the last value evaluated.

# Here is the solution from LS:

# def factors(number)
#   dividend = number
#   divisors = []
#   while dividend > 0 do
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end
#   divisors
# end
