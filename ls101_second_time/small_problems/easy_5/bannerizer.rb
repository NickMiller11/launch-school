# Write a method that will take a short line of text, and print it within a box.

=begin

Input: string
Output: banner

Rules:
-print a banner that includes the input string of text

Algorithm:
-going to need to use str.size here to get the correct number of dashes
- use 5 puts statements to get the right effect

=end

def print_in_box(str)
  p '+-' + '-' * str.size + '-+'
  p '| ' + ' ' * str.size + ' |'
  p '| ' + str + ' |'
  p '| ' + ' ' * str.size + ' |'
  p '+-' + '-' * str.size + '-+'
end


print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
