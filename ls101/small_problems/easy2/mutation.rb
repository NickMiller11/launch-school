# What will the following code print, and why?
# Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# This will print "Moe Larry Curly Shemp Harpo Chico Groucho Zeppo" to
# the screen.  This is becaue each array has it's own object id, and while
# array1's values have been copied into array2, the upcase! method will not
# affect array2

# Well, I was wrong.  Apparently even though the object id's of the arrays are
# different, they are pointing to the same string objects so that if you mutate
# the string objects for one, it carries over to the other.
