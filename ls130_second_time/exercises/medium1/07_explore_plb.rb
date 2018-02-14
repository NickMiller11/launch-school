# For this exercise, we'll be learning and practicing our knowledge of
# returning from lambdas, procs, and implicit blocks. Run each group of
# code below: For your answer to this exercise, write down your observations
# for each group of code. After writing out those observations, write one final
# analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
# def check_return_with_proc
#   my_proc = proc { return }
#   my_proc.call
#   puts "This will never output to screen."
# end

# p check_return_with_proc

# Group 2
# my_proc = proc { return }

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# puts check_return_with_proc_2(my_proc)

# # Group 3
# def check_return_with_lambda
#   my_lambda = lambda { return }
#   my_lambda.call
#   puts "This will be output to screen."
# end

# p check_return_with_lambda

# # Group 4
# my_lambda = lambda { return }
# def check_return_with_lambda(my_lambda)
#   my_lambda.call
#   puts "This will be output to screen."
# end

# p check_return_with_lambda(my_lambda)

# # Group 5
def block_method_3
  yield
end

p block_method_3 { return }

=begin

Observations:

Group 1
- a return called by a proc object will return a value from the method it's called
  in, not just the block

Group 2
- this didn't return anything, not even an error.  My guess is that it
  was unable to call a proc passed into the method (not defined within the method)

Group 3
- The return from the lambda did not exit the method and the method execution
  finished to the end of the definition.

Group 4
- Either the return did not exit the method, or the lambda was not called at all
  even being passed into the method

Group 5
- The block is being yielded to, but the return value is not exiting the method
  because it would return nil if it did

One line explanation:
- Returns in procs will exit the method, while they will not for lambdas or blocks

=end
