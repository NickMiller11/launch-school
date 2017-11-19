# What is the return value of reject in the following code? Why?

a = [1, 2, 3].reject do |num|
  puts num
end

p a 

=begin

The return value of reject is [1, 2, 3] since it will return an array of all
elements that evaluate to not true.  Puts will evaluate to nil, which has a
falsey value, causing reject to reject nothing.

=end
