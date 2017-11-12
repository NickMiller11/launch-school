# Write a method that takes a positive integer, n, as an argument, and
# displays a right triangle whose sides each have n stars. The hypotenuse
# of the triangle (the diagonal side in the images below) should have
# one end at the lower-left of the triangle, and the other end at the upper-right.

def triangle(int)
  stars = 0
  white_space = int
  loop do
    stars += 1
    white_space -= 1
    puts("#{' ' * white_space}" + "#{'*' * stars}")
    break if stars == int
  end
end



triangle(5)

#     *
#    **
#   ***
#  ****
# *****


triangle(9)
#
#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
