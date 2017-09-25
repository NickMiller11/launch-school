advice = "Few things in life are as important as house training your pet dinosaur"

# shorten this sentence and remove everything starting from "house".
# use the string#slice! method to make the return value
# "Few things in life are as important as ". But leave the advice variable
# as "house training your pet dinosaur."

advice.slice!("Few things in life are as important as ")
p advice

# when you only use the slice method, the method will still return the
# string "Few things in life are as important as " but will not
# mutate the variable advice.

# after checking the solution, it looks like I did this the hard (but simple)
# way by fully typing out the string I wanted deleted (and returned).
# the smarter way of doing this is actually using indices.

advice = "Few things in life are as important as house training your pet dinosaur"

p advice.slice!(advice.index('house'), -1)
