# In the previous practice problem we added Dino to our array like this:
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# How can we add multiple items to our array?

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy")
p flintstones

# checking the solutions, we can also do the below:
p flintstones.push("Dino").push("Hoppy")
p flintstones.concat(%w(Dino Hoppy)) # concat is used for adding an array of items
