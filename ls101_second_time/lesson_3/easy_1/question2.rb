# Question 2
#
# Describe the difference between ! and ? in Ruby.
# And explain what would happen in the following scenarios:

    what is != and where should you use it?
    # it compares two objects and returns true if they are not equal

    put ! before something, like !user_name
    # it returns a boolean opposite of the objects truthiness.  It will
    # return false for everything except false and nil.

    put ! after something, like words.uniq!
    # for certain methods, the bang symbol after a method name means that
    # this version of the method mutates the method caller

    put ? before something
    # ternary operator for if..else

    put ? after something
    # certain methods have this after their name to designate that they return
    # a boolean


    put !! before something, like !!user_name
    # returns a boolean that is equal to the object's truthiness
