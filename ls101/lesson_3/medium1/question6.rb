# In an earlier practice problem we saw that depending on variables to be
# modified by called methods can be tricky:

def tricky_method(a_string_param, an_array_param)
  a_string_param << " rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# We learned that whether the above "coincidentally" does what we think we
# wanted "depends" upon what is going on inside the method.

# How can we refactor this practice problem to make the result easier
# to predict and easier for the next programmer to maintain?

# ---

# Well, first we can separate this into two methods.  One big thing I've learned
# so far in LS is that one method should do one thing.  So let's separate these.

# the next thing we can do is to mutate the string variable rather than reassign it

def tricky_method_str(a_string_param)
  a_string_param << " rutabaga"
end

def tricky_method_arr(an_array_param)
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_str(my_string)
tricky_method_arr(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# After looking at the answer, I realize that I was going the wrong direction with
# this.  Here is what the solution says:

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Ok, what can I learn from this?

# 1: Be clear about what you are returning from the method
# 2: Clearly reassign variables based on the return of the method
