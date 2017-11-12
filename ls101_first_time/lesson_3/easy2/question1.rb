# See if "Spot" is present in this hash of people and their age:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages["Spot"]
p ages["Herman"]

# Bonus: What are two other hash methods that would work just as well
# for this solution?

p ages.fetch("Spot") { "Not here" } # not ideal for just finding out if a key exists
p ages.has_key?("Spot") # seems like this is a deprecated method now

# solutions from the book

p ages.key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")
