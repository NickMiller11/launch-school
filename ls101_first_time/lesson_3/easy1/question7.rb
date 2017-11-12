def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval(how_deep)

# what will be the result of running with Kernal#eval?
# ----
# I believe running Kernel#eval on the variable how_deep will return
# the integer 42 because it runs the methods assigned to variable how_deep
# ---running code---
# Well, I was right!  I had to print out the result, but it was 42!
