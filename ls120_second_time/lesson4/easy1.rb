=begin

1)

Which of the following are objects in Ruby? If they are objects, 
how can you find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142

=> These are all objects.  You can find out the class by invoking the .class
method on them

=end

=begin

2)

If we have a Car class and a Truck class and we want to be able to go_fast, 
how can we add the ability for them to go_fast using the module Speed? 
How can you check if your Car or Truck can now go fast?

=end

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast
Truck.new.go_fast

=begin

3)

In the last question we had a module called Speed which contained 
a go_fast method. We included this module in the Car class as shown below.

When we called the go_fast method from an instance of the Car class 
(as shown below) you might have noticed that the string printed when 
we go fast includes the name of the type of vehicle we are using. 
How is this done?

=> This is because we are calling the method #class on self, interpolating the
string name of the class that is calling the method.

=end

=begin

4) 

If we have a class AngryCat how do we create a new instance of this class?

The AngryCat class might look something like this:

=end

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

kitty = AngryCat.new

=begin

5)

Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=> The Pizza class has an instance variable because there is an @ sign in
front of it.

=end

=begin

6)

What could we add to the class below to access the instance variable @volume?

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

=end

=begin

7)

What is the default return value of to_s when invoked on an object? 
Where could you go to find out if you want to be sure?

=> The default return value of to_s is the class and object id of the object

=end

=begin

8)

If we have a class such as the one below:

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

You can see in the make_one_year_older method we have used self. 
What does self refer to here?

=> self refers to the instance when using the setter method to 
increment the age by one.

=end

=begin

9) 

If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

In the name of the cats_count method we have used self. 
What does self refer to in this context?

=> In this context, it is denotating a class method definition.

=end

=begin

10)

If we have the class below, 
what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

Bag.new("green", "paper")

=end

