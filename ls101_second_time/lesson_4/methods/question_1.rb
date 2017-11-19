# What is the return value of the select method below? Why?

a = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p a

=begin
The return value is [1,2,3] because 'hi' is the last evaluated line in the block
and will always evaluate to true
=end
