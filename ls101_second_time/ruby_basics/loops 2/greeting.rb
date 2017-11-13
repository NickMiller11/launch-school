#Given the code below, use a while loop to print "Hello!" twice.

=begin

Input: Integer
Output: Print string to screen

Rules:
- use a while loop to print a string twice

Algorithm:
- Increment number_of_greetings variable down until 0
- Add a while statement that puts until variable equals 0

=end

# Solution 1

def greeting(times)
  while times != 0
    puts 'Hello!'
    times -= 1
  end
end

number_of_greetings = 2

greeting(number_of_greetings)
