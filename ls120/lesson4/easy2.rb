# # 1
#
# # You are given the following code:
#
# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end
#
#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end
#
# # What is the result of calling
#
# oracle = Oracle.new
# p oracle.predict_the_future
#
# # This will return the string "You will" plus one of the three strings in the array
# # in the choices instance method.

# # 2
#
# # We have an Oracle class and a RoadTrip class that inherits from the Oracle class.
#
# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end
#
#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end
#
# class RoadTrip < Oracle
#   def choices
#     ["visit Vegas", "fly to Fiji", "romp in Rome"]
#   end
# end
#
# # What is the result of the following:
#
# trip = RoadTrip.new
# p trip.predict_the_future
#
# # This will return the string "You will" plus one of the three options in the
# # array under the Roadtrip#choices instance method because Ruby will search the
# # RoadTrip class first when looking up choices.

# # 3
#
# # How do you find where Ruby will look for a method when that
# #   method is called? How can you find an object's ancestors?
#
# module Taste
#   def flavor(flavor)
#     puts "#{flavor}"
#   end
# end
#
# class Orange
#   include Taste
# end
#
# class HotSauce
#   include Taste
# end
#
# # What is the lookup chain for Orange and HotSauce?
#
# # You can find out where Ruby will look for a method by calling the ancestors
# # method on any particular class.
#
# puts Orange.ancestors
# puts
# puts HotSauce.ancestors

# # 4
#
# # What could you add to this class to simplify it and
# # remove two methods from the class definition while
# # still maintaining the same functionality?
#
# class BeesWax
#   attr_accessor :type
#
#   def initialize(type)
#     @type = type
#   end
#
#   # def type
#   #   @type
#   # end
#   #
#   # def type=(t)
#   #   @type = t
#   # end
#
#   def describe_type
#     puts "I am a #{type} of Bees Wax"
#   end
# end
#
# bs = BeesWax.new('sweet type')
# bs.describe_type
#
# # You can remove the manual setter and getter methods, and add a attr_accessor
# # to the class definition
#
# # The answer also makes a good point that we can remove the @ symbol from the
# # instance variable being references in the string in the describe type instance
# # method.  We can just remove the @ symbol from the string.  I believe we still
# # need either self or @ when accessing the instance variable by the setter method.

# # 5
#
# # There are a number of variables listed below. What are the different types
# # and how do you know which is which?
#
# excited_dog = "excited dog" # => local variable
# @excited_dog = "excited dog" # => instance variable
# @@excited_dog = "excited dog" # => class variable
#
# # You can distinguish between the different types of variables by the @ symbol.
# # Variables with one @ symbol are instance variables, with two @ symbols
# # are class variables.  Those without any @ symbols are local variables.

# # 6
#
# # If I have the following class:
#
# class Television
#   def self.manufacturer
#     # method logic
#   end
#
#   def model
#     # method logic
#   end
# end
#
# # Which one of these is a class method (if any) and how do you know?
# # How would you call a class method?
#
# # The 'self.manufacturer' is a class method because it starts with 'self'.
# # These can be called directly on the class, by Television.manufacturer.

# # 7
#
# # If we have a class such as the one below:
#
# class Cat
#   @@cats_count = 0
#
#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end
#
#   def self.cats_count
#     @@cats_count
#   end
# end
#
# # Explain what the @@cats_count variable does and how it works.
# # What code would you need to write to test your theory?
#
# # The @@cats_count variable is a class variable and it keeps track of the number
# # of Cat objects in existence.  It does this by incrementing the integer the
# # class variable is assigned to by 1 each time a new Cat object is instantiated.
# # We can test this with the following code.
#
# puts Cat.cats_count
# vega = Cat.new('coon')
# puts Cat.cats_count
# max = Cat.new('normal grey')
# puts Cat.cats_count

# # 8
#
# # If we have this class:
#
# class Game
#   def play
#     "Start the game!"
#   end
# end
#
# # And another class:
#
# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end
#
# # What can we add to the Bingo class to allow it to inherit
# # the play method from the Game class?
#
# # We can add '< Game' to the Bingo class definition so that it inherits all methods
# # in the Game class, including the play method.

# # 9
#
# # If we have this class:
#
# class Game
#   def play
#     "Start the game!"
#   end
# end
#
# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end
#
# # What would happen if we added a play method to the Bingo class,
# # keeping in mind that there is already a method of this name in the
# # Game class that the Bingo class inherits from.
#
# # If we added a play method to the Bingo class, a Bingo class objet
# # would then invoke that method instead of the play method in the Game class.

# 10
#
# What are the benefits of using Object Oriented Programming in Ruby?
# Think of as many as you can.
#
# OOP allows us to encapsulate code and keep parts of programs from unneccesarily
# affecting other parts
#
# OOP allows us to reuse modularized code, quickening development.
#
# OOP allows us to customize codes for a particular need better by creating our
# own classes and methods.
#
# OOP allows programmers to think more abstractly about the code that they are
# writing
#
# Objects represented by nouns are easier to conceptualize.
#
# Code complexity can be more easily anaged.
