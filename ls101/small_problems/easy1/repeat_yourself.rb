# input - string and positive integer
# output - multiple strings

# take in a string and number.  Create a method where
# using the .times method that uses the number to 
# print the string that many times

def repeat(string, num)
  num.times { puts string }
end

repeat('Hello', 5)