# What is the block's return value in the following code?
# How is it determined? Also, what is the return value of any? in this code.
# What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin
The return value is true.  This is because the any? method returns a boolean
if the code block returns true for any of the objects in the collection.  This
code also prints the first object since any? returns true immediately after
the first expresion that returns true to it. 
=end
