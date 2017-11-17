# What will the following code print, and why? 
# Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
puts array1[0].object_id
puts array2[0].object_id
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin

The following code will print the array with the strings Larry, Shemp, and Chico 
all in caps.

This is because the objects at each index location share the same object id, so
mutations to those objects will persist between collections.

=end