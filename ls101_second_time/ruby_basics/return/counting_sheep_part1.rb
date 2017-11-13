# What will the following code print? Why?
# Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep

=begin

This will print the string 'nil' five times because the return value of
the method count_sheep is nil

I was wrong!  This printed out the numbers 0 to 5 because the times method
passes the integers 0-4 into the block.  Once the times method is finish, it
returns the integer it was called on, 5, which is printed to the screen by the
last puts method.

=end
