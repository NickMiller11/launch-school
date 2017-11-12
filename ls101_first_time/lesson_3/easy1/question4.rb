# What do the following method calls do (assume we reset numbers
# to the original array between method calls)?

numbers = [1, 2, 3, 4, 5]

p numbers.delete_at(1)
# I think this will return a new array [1, 3, 4, 5]
p numbers

numbers = [1, 2, 3, 4, 5]

p numbers.delete(1)
# I think this will return a new array [2, 3, 4, 5]
p numbers

# Sum up: I got the right answer but I worded it incorrectly.  These methods
# are both destructive, and return the value that they delete from the array
# I did correctly guess HOW the array was modified, but missed the fact that
# these methods mutate the original array, not return a new one
