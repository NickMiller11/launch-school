# What will the following code print? Why?
# Don't run it until you've attempted to answer.

def meal
  'Evening'
end

puts meal

=begin

This will print the string 'Evening' to the screen because puts will print
the return value from the method meal, which in this case is the last evaluated
expression, the string 'Evening.'

=end
