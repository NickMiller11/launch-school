# The result of the following statement will be an error:
# Why is this and what are two possible ways to fix this?

# puts "the value of 40 + 2 is " + (40 + 2)

# The above statement will cause you to get a type error because
# you cannot concatonate a string to an integer.

#In order to fix this, you could either use string interpolation:

puts "the value of 40 + 2 is #{40 + 2}"

# or you could call the method to_s on the integer
puts "the value of 40 + 2 is " + (40 + 2).to_s
