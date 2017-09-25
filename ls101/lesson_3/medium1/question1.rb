# Write a one-line program that creates the following output 10 times,
# with subsequent line indented 1 space to the right.

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# This one was difficult for me to figure out
# I forgot that the times method iterates the block passed into it,
# not just does that block 10 times.  Therefore, if you pass a number
# into your block argument (like the example above),
# then it iterates that number
