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