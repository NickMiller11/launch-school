# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name, a
# comma, a space, and the first name.

=begin

Input: string
Output: string

Rules:
- return input name string as last name, comma, first name

Algorithm:
- split the input string, switch the values and join with a comma

=end

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
