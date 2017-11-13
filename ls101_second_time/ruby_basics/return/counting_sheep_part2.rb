# What will the following code print? Why? 
# Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep

=begin

This will print the integers 0-4 and then 10.  The 0-4 will be printed because
the times method will pass those numbers into the block, where they will be
assigned to variable sheep and printed to the screen.  The integer 10 will be
printed to the screen because the last puts value will print the return value from
the count sheep method.

=end