# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# One problem is that we need to keep track of different breeds of dogs, 
# since they have slightly different behaviors. For example, bulldogs can't 
# swim, but all other dogs can.

# 1. Create a sub-class from Dog called Bulldog overriding the swim method to 
# return "can't swim!"

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end
  

# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# karl = Bulldog.new
# puts karl.speak           # => "bark!"
# puts karl.swim            # => "can't swim!"

# 2. Let's create a few more methods for our Dog class.
# Create a new class called Cat, which can do everything a dog can, except 
# swim or fetch. Assume the methods do the exact same thing. Hint: don't just 
# copy and paste all methods in Dog into Cat; try to come up with some class 
# hierarchy.

class Animal
  def speak
    'bark!'
  end
  
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

=begin
3. Draw a class hierarchy diagram of the classes from step #2

4. What is the method lookup path and how is it important?

Cat
Animal
Object
Kernal
Basic Object

Dog
Animal
Object
Kernal
Basic Object

This is important because it will tell us, in order, where Ruby will look for
methods when invoked.

=end
