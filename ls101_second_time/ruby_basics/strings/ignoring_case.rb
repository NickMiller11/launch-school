# Using the following code, compare the value of name with the string
# 'RoGeR' while ignoring the case of both strings. Print true if the
#   values are the same; print false if they aren't. Then, perform the
#   same case-insensitive comparison, except compare the value of name
#     with the string 'DAVE' instead of 'RoGeR'.

name = 'Roger'

p name.downcase == 'RoGeR'.downcase
p name.downcase == 'DAVE'.downcase

# Expected output:
#
# true
# false
