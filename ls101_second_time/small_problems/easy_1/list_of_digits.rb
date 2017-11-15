# Write a method that takes one argument, a positive integer,
# and returns a list of the digits in the number.
#
# Examples:

=begin

input: integer
output: array containing digits of integer

algorithm:
- use digits method to separate the integer
- convert to string, use chars to convert to array, and each with to_i methods

=end

def digit_list1(num)
  num.digits.reverse
end

def digit_list2(num)
  num.to_s.chars.map(&:to_i)
end


puts digit_list1(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list1(7) == [7]                     # => true
puts digit_list1(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list1(444) == [4, 4, 4]             # => true

puts digit_list2(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list2(7) == [7]                     # => true
puts digit_list2(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list2(444) == [4, 4, 4]             # => true
