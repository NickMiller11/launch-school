# Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".

# Review the String#slice! documentation, and use that method to make the
# return value "Few things in life are as important as ". But leave the advice
# variable as "house training your pet dinosaur.".

puts advice.slice!(0..38)

# If you use the String#slice method instead, it returns the value but doesn't
# mutate the caller
