
# 1. a method that returns the sum of two integers

# casual pseudo-code

intake first number and set as a variable
intake second number and set as a variable
add the two numbers together and set as a new variable
return the new variable

# formal pseudo-code

START

SET number1 = GET from user
SET number2 = GET from user
SET result = number1 + number2
PRINT result

END

# 2. a method that takes an array of strings, and returns 
# a string that is all those strings concatenated together

# casual pseudo-code

loop over array, pulling off the string at index 0
add the string to a new varaible
return the variable once all of the strings have been looped through

# formal pseudo-code

START

SET result = nil

WHILE there are strings left to loop through
  shift the first string
  add the new string to result
end

PRINT result

END

# 3. a method that takes an array of integers, and 
# returns a new array with every other element

# casual pseudo-code

create variable new_arr
for each of the integers in the array,
  shift the first integers
  add the integer to the new_arr if the modulus of the index and 2 does not equal 0

print the result

# formal pseudo-code

START

SET new_arr = []

WHILE there are integers left to loop through
  shift the first integer
  new_arr.push(integer) if integer[index] % 2 != 0
end

print the result


