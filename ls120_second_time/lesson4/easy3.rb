=begin

1) If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

What happens in each of the following cases:

case 1:

hello = Hello.new
hello.hi

=> "Hello" will be printed to the screen

case 2:

hello = Hello.new
hello.bye

=> NoMethodError will be raised

case 3:

hello = Hello.new
hello.greet

=> Incorrect number of arguments, error will be raised

case 4:

hello = Hello.new
hello.greet("Goodbye")

=> "Goodbye" will be printed to the screen

case 5:

Hello.hi

= NoMethodError since hi is an intance method, not a class method

=end

=begin

2) In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

If we call Hello.hi we get an error message. How would you fix this?

=> We could either fix this by prepening the method name with "self" to make it
a class method, or instantiate an object and calling the method on the object.

=end

=begin

3) When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class, 
both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

=> We can create two different instances of this class like the below
tabby = AngryCat.new(4, "Tabster")
coon = AngryCat.new(2, "Coon")

=end

=begin

4) Question 4
Given the class below, if we created a new instance of the class and then 
called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end

How could we go about changing the to_s output on this method to look
like this: I am a tabby cat? (this is assuming that "tabby" is the type we 
passed in during initialization).

=> We can change to_s by adding a to_s method like the below

def to_s
  "I am a #{@type} cat"
end

=end

=begin

5) If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

What would happen if I called the methods like shown below?

tv = Television.new #=> A new object is instantiated and assigned to variable tv
tv.manufacturer #= NoMethodError, this is a class method being called on an object
tv.model #=> This runs properly

Television.manufacturer #=> This runs properly
Television.model #=> NoMethodError, this is an instance method being called on a class

=end

=begin

6) If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

In the make_one_year_older method we have used self. What is another way we 
could write this method so we don't have to use the self prefix?

=> You could write this as @age

=end

=begin

7) What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of
    super high and a color of green"
  end

end

=> The attr_accessor is not used and can be removed.
=> Also the return

=end