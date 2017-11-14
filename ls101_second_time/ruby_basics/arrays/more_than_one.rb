# In the code below, an array containing different
# types of pets is assigned to pets.

pets = ['cat', 'dog', 'fish', 'lizard']

# Select 'fish' and 'lizard' from pets at the same time,
# assign the return value to a variable named my_pets,
# then print the value of my_pets.
#
# Expected output:
#
# I have a pet fish and a pet lizard!

pet_fish = pets[2]
pet_lizard = pets[3]

value = "I have a pet #{pet_fish} and a pet #{pet_lizard}!"

puts value
