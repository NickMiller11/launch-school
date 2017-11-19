# What do you expect to happen when the greeting variable is
#   referenced in the last line of the code below?

if false
  greeting = “hello world”
end

p greeting

# greeting will be nil because even though line 5 is not evaluated, Ruby still
# creates initializes a variable and sets it to nil
