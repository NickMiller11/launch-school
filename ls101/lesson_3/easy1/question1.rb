numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# I would expect the code to print out "1, 2, 3" because
# the uniq method removes all duplicitous values
# (in other news, I like using the word duplicitous)

# running code...

# I was wrong!  Tricksy code!  In order for my guess to be
# printed out, the uniq! destructive method would need to be called.
# In other nitty gritty news, I should remember that an array
# is printed out with each value on a separate line
