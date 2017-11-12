
famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it

# 1:

p famous_words = "Four score and #{famous_words}"

# 2:

famous_words = "seven years ago..."
p famous_words.prepend("Four score and ")
