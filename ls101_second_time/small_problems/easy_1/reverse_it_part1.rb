# Write a method that takes one argument, a string,
# and returns the same string with the words in reverse order.

# Examples:
#
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
#
# The tests above should print true.

=begin

input: string
output: string with words in reverse order

algorithm:
- convert string to array, splitting by spaces
- reverse array
- join together

- convert string to array, splitting by spaces
- create result string
- pop each array value off and push it to the string

=end

def reverse_sentence1(str)
  str.split(' ').reverse.join(' ')
end

def reverse_sentence2(str)
  result_str = ''
  arr = str.split(' ')
  arr.size.times do
    result_str << arr.pop + ' '
  end
  result_str.rstrip
end

puts reverse_sentence1('') == ''
puts reverse_sentence1('Hello World') == 'World Hello'
puts reverse_sentence1('Reverse these words') == 'words these Reverse'

puts reverse_sentence2('') == ''
puts reverse_sentence2('Hello World') == 'World Hello'
puts reverse_sentence2('Reverse these words') == 'words these Reverse'
