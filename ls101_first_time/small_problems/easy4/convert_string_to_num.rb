# The String#to_i method converts a string of numeric characters
# (including an optional plus or minus sign) to an Integer.
# String#to_i and the Integer constructor (Integer()) behave similarly.
# In this exercise, you will create a method that does the same thing.

# Write a method that takes a String of digits, and returns
# the appropriate number as an integer. You may not use any
# of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you
# worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in
# Ruby, such as String#to_i, Integer(), etc. Your method should do
# this the old-fashioned way and calculate the result by analyzing
# the characters in the string.

def string_to_integer(string)
  counter = 0
  int = 0
  loop do
    num = case string[counter]
    when '1'
      1
    when '2'
      2
    when '3'
      3
    when '4'
      4
    when '5'
      5
    when '6'
      6
    when '7'
      7
    when '8'
      8
    when '9'
      9
    else
      0
    end
    int += num
    counter += 1
    break if counter == string.length
    int *= 10
  end
  int
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

# Thoughts: Use one large case statement and add them all together? Will need
# to loop to hit each digit.
