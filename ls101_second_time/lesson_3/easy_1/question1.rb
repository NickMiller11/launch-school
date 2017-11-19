# What would you expect the code below to print out?

=begin

I would expect the code to print out 1, 2, 2, 3 because the uniq method
does not mutate the caller.  Only uniq! does.

=end

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
