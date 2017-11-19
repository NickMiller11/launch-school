# The result of the following statement will be an error:

puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
# puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?

=begin

This is result in an error because you are trying to
concatonate strings and integers together
You can fix this using string interporation or calling to_s on the integers

=end
