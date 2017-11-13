# What will the following code print? Why? 
# Don't run it until you've attempted to answer.

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number

=begin

This will print 1 because everything is truthy except false and nil, so the if
statement will be executed.  Because number variable is assigned to 1, 1 will
be returned and printed to the screen by the puts method.

=end