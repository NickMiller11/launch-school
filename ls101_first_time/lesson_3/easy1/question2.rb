# Describe the difference between ! and ? in Ruby.
# => ! is the bang operator and does a couple of things,
# => basically making certain methods destructive, or being
# => used as an opposite comparison

# => I'm not really sure what ? is called, but I've seen it used
# => as a ternary operator, creating a small 'if true, do this,
# => if false, do that' conditional


# And explain what would happen in the following scenarios:

# 1. what is != and where should you use it?
# => this basically means "not equals to" and should be used
# => as a comparison operator when comparing two values.
# => an example might be: break if x != 0

# 2. put ! before something, like user_name
# => I believe this would make the value falsy, but I'm not
# => 100% sure

# 3. put ! after something, like words.uniq!
# => this will make certain methods destructive, mutating the
# => objects that the methods are being called on

# 4. put ? before something
# => no idea what this does, need to look it up

# 5. put ? after something
# => this is how it is used as a ternary operator, not sure if
# => it is used in this way in any other circumstance

# 6. put !! before something, like !!user_name
# => this makes any value true other than false or nil

# ----------

# Ok, just looked at the answers, apparently it's simpler
# than I thought.  ! and ? at the end of methods are just part
# of the method name. != means 'not equals'. ? : is the
# ternary operator of if..else (I'm calling that one a win).
