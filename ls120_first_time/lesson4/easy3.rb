# # 1
#
# class Greeting
#   def greet(message)
#     puts message
#   end
# end
#
# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end
#
# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end
#
# # What happens in each of the following cases:
#
# # case 1: - This will return "Hello" because the variable hello is accessing
# # the instance method 'hi' in the Hello class
#
# hello = Hello.new
# hello.hi
#
# # case 2: - This will return a NoMethodError.  While there is a 'bye' instance
# # method, it's under a different class that the Hello class objects don't have
# # access to
#
# hello = Hello.new
# hello.bye
#
# # case 3: - This will return an error that says that there are an incorrect
# # number of arguments for the method.  This will call the 'greet' instance method
# # inherited from the Greeting class.  This instance method, however, is defined
# # with one parameter and this method call does not specify an argument for that
# # parameter
#
# hello = Hello.new
# hello.greet
#
# # case 4: - This will return the string "Goodbye" since this is calling the 'greet'
# # instance method inherited from the Greeting class, passing in the string object
# # "Goodbye" as an argument
#
# hello = Hello.new
# hello.greet("Goodbye")
#
# # case 5: - This will return a NoMethodError since this is trying to call a
# # class method 'hi' and while there is a method 'hi' in the Hello class, it is
# # an instance method.
#
# Hello.hi

# # 2
#
# # In the last question we had the following classes:
#
# class Greeting
#   def greet(message)
#     puts message
#   end
# end
#
# class Hello < Greeting
#   def self.hi
#     greeting = Hello.new
#     greeting.greet("Hello")
#   end
# end
#
# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end
#
# Hello.hi
#
# # If we call Hello.hi we get an error message. How would you fix this?
#
# # You would need to add 'self' to both the greet method in the Greeting class
# # as well as the hi method in the Hello class to turn them both from instance
# # methods to class methods since 'Hello.hi' is a class method call.
#
# # Interesting!  After taking a look at the answer, it looks like they added
# # 'self' to the hi instance method turning it into a class method, and then added
# # a two new lines of code. One of these lines of code instansiated a new Hello class
# # object and the other line called the 'greet' instance method on it.

# # 3
#
# # When objects are created they are a separate realization of a particular class.
# #
# # Given the class below, how do we create two different instances of this class,
# # both with separate names and ages?
#
# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end
#
#   def age
#     puts @age
#   end
#
#   def name
#     puts @name
#   end
#
#   def hiss
#     puts "Hisssss!!!"
#   end
# end
#
# tabby = AngryCat.new(2, 'tabster')
# coon = AngryCat.new(4, 'old coon')
#
# puts tabby
# puts coon
#
# # We can create two different instances of this class by creating two new objects
# # and assigning them different instance variables.  We can then check by calling
# # puts on the objects to see their id numbers.

# # 4
#
# # How could we go about changing the to_s output on this method to look like
# # this: I am a tabby cat? (this is assuming that "tabby" is the type we passed
# #   in during initialization).
#
# class Cat
#   attr_reader :type
#
#   def initialize(type)
#     @type = type
#   end
#
#   def to_s
#     "I am a #{type} cat."
#   end
# end
#
# tabby = Cat.new("tabby")
# puts tabby

# # 5
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
# # What would happen if I called the methods like shown below?
#
# tv = Television.new
# tv.manufacturer
# tv.model
#
# Television.manufacturer
# Television.model
#
# # You would get a NoMethodError for the tv.manufacturer method call because that
# # is a class method and it's being called on an object.
#
# # You will be able to run the instance method Television#model
#
# # You will be able to run the class method Television::manufacturer
#
# # You will get a NoMethodError for the Television.model method call because that
# # is an instance method being called on the class.

# # 6
#
# # If we have a class such as the one below:
#
# class Cat
#   attr_accessor :type, :age
#
#   def initialize(type)
#     @type = type
#     @age  = 0
#   end
#
#   def make_one_year_older
#     @age += 1
#   end
# end
#
# cat = Cat.new('tabby')
# cat.make_one_year_older
# p cat.age
#
# # In the make_one_year_older method we have used self.
# # What is another way we could write this method so we
# # don't have to use the self prefix?
#
# # You could just write this without the self prefix because there is a
# # setter method for the @age instance variable.
#
# # Well, I was wrong!  It looks like the attr_accessor method doesn't make the
# # instance variable accessible without the self keyword.  We could probably use
# # the @ symbol before the instance variable and get it to work.
#
# # Ok, so it looks like once you have the attr_accessor in the class definition,
# # then you can use both self and @ interchangably to access instance variables

# # 7
#
# # What is used in this class but doesn't add any value?
#
# class Light
#   attr_accessor :brightness, :color
#
#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end
#
#   def self.information
#     return "I want to turn on the light with a brightness
#     level of super high and a color of green"
#   end
#
# end
#
# # The setter and getter methods are not used at all.  Also, we don't need to use
# # the return statement as the string will be the last (and only) evaluated
# # expression and therefore will automatically be returned.
#
# # After taking a closer look, it looks like they want to use string interpolation
# # to reference the brightness and color, but haven't structured their return string
# # like that.  If they wanted to do that, I would keep the setter and getter methods
# # and remove the 'self' from the information method as they would want this to be an
# # instance method rather than a class method.
