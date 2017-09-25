# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# The answer of the above code will be 34
# The reason is that while 'some number' is reassigned to 42 + 8 and then
# assigned to new_answer, new_answer is not printed to the screen
