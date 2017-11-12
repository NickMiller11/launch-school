# What do you expect to happen when the greeting variable
# is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

p greeting

# Nothing will happen because variables are treated as truthy by default

# After checking the solution, it looks like I got the question right..sort of
# greeting evaluates to nil because it is truthy, but it is still initialized
# as nil even though the if block doesn't get executed.
