# What will the following code print? Why?
# Don't run it until you've attempted to answer.

def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal

=begin

This will print both 'Dinner' and 'Breakfast' to the screen.  The puts method inside
of the meal method will print 'Dinner' to the screen, and then the puts method calling
meal method will print 'Breakfast', the return value, to the screen.

=end
