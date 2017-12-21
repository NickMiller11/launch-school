# 1. How do we create an object in Ruby? Give an example of the creation of
# an object?

=begin

We can create a new object by calling the 'new' method on a class.

See bottom for example:

=end



# 2. What is a module? What is its purpose? How do we use them with our
# classes? Create a module for the class you created in exercise 1 and
# include it properly.

=begin

A module is like a class in the sense that it can hold methods (and even
entire classes) within itself, however cannot instantiate new objects like
a class can.  Its purpose is to create functionality that can be added and used
by many classes, but only written once.  This is an example of polymorphism.

Addition from LS answer - modules allow us to group reusable code in one place.
It can also act as a namespace.

=end

module Barkable
  def bark
    "bark!"
  end
end

class Dog
  include Barkable
end

fido = Dog.new
