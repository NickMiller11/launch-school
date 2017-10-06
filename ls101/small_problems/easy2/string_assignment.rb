# What does this print out? Can you explain these results?

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# This will bring out two lines, each one containing "BOB".  This is because
# the upcase! method destructively modifies the object that both variables
# are pointing to.
