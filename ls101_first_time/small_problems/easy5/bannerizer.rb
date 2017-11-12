# Write a method that will take a short line of text, and print it within a box.

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
#
#
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

def print_in_box(str)
  width = str.length
  puts("+-" + "#{"-"*width}" + "-+")
  puts("| " + "#{" "*width}" + " |")
  puts("| " + "#{str}" + " |")
  puts("| " + "#{" "*width}" + " |")
  puts("+-" + "#{"-"*width}" + "-+")
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
