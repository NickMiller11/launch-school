# Using an if/else statement, run a loop that prints "The loop was processed!"
# one time if process_the_loop equals true. Print "The loop wasn't processed!"
# if process_the_loop equals false.

=begin

Input: Boolean
Output: Print string to string

Rules:
- Use an if/else statement
- Run a loop that prints a statement if loop was processed one time to screen
- Print a statement one time if loop wasn't processed

Algorithm:
- create an if conditional, if variable process_the_loop equals true
- create a loop
- print statement that loop was processed
- break
- else, print statement that loop wasn't processed


=end

process_the_loop = [true, false].sample

if process_the_loop == true
  loop do
    puts("The loop was processed!")
    break
  end
else
  puts("The loop wasn't processed!")
end
