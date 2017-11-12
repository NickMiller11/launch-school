advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino")

# This is the solution provided.
p advice.match("Dino")

# After checking the documentation, and checking online,
# it seems that String#match takes in a regex object or pattern string
# while String#include? takes in a string as the parameter.
# Seems like both would work in this case.
