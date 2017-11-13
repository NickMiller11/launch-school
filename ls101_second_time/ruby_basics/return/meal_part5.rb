# What will the following code print? Why?
# Don't run it until you've attempted to answer.

def meal
  'Dinner'
  puts 'Dinner'
end

p meal

=begin

This will print both 'Dinner' and nil to the screen.  The puts inside the method meal
will print 'Dinner' to the screen, however the return value of that puts.inspect method,
 nil, will also be printed to the screen.

=end
