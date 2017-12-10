# # 1
#
# # Which of the following are objects in Ruby? If they are objects,
# # how can you find out what class they belong to?
#
# p true.class
# p "hello".class
# p [1, 2, 3, "happy days"].class
# p 142.class
#
# # All of the above are objects (everything in Ruby is an object!).  We can find
# # find out what class they belong to by calling the 'class' method on them.

# # 2
#
# # If we have a Car class and a Truck class and we want to be able to go_fast,
# # how can we add the ability for them to go_fast using the module Speed?
# # How can you check if your Car or Truck can now go fast?
#
# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end
#
# class Car
#   include Speed
#
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end
#
# class Truck
#   include Speed
#
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end
#
# car = Car.new
# car.go_fast
#
# truck = Truck.new
# truck.go_fast
#
# # We can mixin the Speed module by including it in the Car and Truck classes.
# # We can then check to see if they can go fast by instantiating a new object
# # for each class and calling the go_fast instance method on them.

# # 3
#
# # In the last question we had a module called Speed which contained a
# # go_fast method. We included this module in the Car class as shown below.
#
# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end
#
# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end
#
# # When we called the go_fast method from an instance of the Car class
# # (as shown below) you might have noticed that the string printed when
# # we go fast includes the name of the type of vehicle we are using.
# # How is this done?
#
# # >> small_car = Car.new
# # >> small_car.go_fast
# #
# # I am a Car and going super fast!
#
# # By calling self.class via string interpolation, the car object is calling itself
# # and then invoking the class method on it, which returns the name of it's class.
# # In this case, it is returning the class of the small_car object, which is Car.
#
# # The answer brings up a good point, that we don't need to define a
# # to_s method because string interpolation will handle that for us.

# # 4
#
# # If we have a class AngryCat how do we create a new instance of this class?
#
# # The AngryCat class might look something like this:
#
# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end
#
# newcat = AngryCat.new
#
# # We can create a new instance of this class by calling AngryCat.new and assigning
# # it to a local variable.

# # 5
#
# # Which of these two classes has an instance variable and how do you know?
#
# class Fruit
#   def initialize(name)
#     name = name
#   end
# end
#
# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end
#
# # The Pizza class has an instance variable because it starts with the @ symbol
#
# # The answer makes a good point by telling us that we can double check by calling
# # the method "instance_variables" on instances of these classes like the below
#
# sweet_fruit = Fruit.new("banana")
# delicious_pizza = Pizza.new("mushroom")
#
# p sweet_fruit.instance_variables
# p delicious_pizza.instance_variables

# # 6
#
# # What could we add to the class below to access the instance variable @volume?
#
# class Cube
#   attr_reader :volume
#   def initialize(volume)
#     @volume = volume
#   end
# end
#
# class Cube
#   def initialize(volume)
#     @volume = volume
#   end
#
#   def volume
#     @volume
#   end
# end
#
# cubie = Cube.new(10)
# puts cubie.volume
#
# # We could add a getter method to the Cube class by either:
# # add attr_reader
# # add a getter method manually
#
# # The answer makes a good point that we don't actually need either of the above
# # and we could call the "instance_variable_get" method on the object to return
# # the instance variable
#
# puts cubie.instance_variable_get("@volume")

# # 7
#
# # What is the default return value of to_s when invoked on an object?
# # Where could you go to find out if you want to be sure?
#
# # The default return value of to_s when invoked on an object is that it returns
# # the class and the encoding of the object id.
#
# # We could either look at ruby docs if we want to be sure, or test it out for
# # ourselves.
#
# class Nick
#   def initialize(n, a)
#     @name = n
#     @age = a
#   end
# end
#
# nick = Nick.new('Nicko', 33)
# puts nick
# puts nick.object_id

# # 8
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
#     self.age += 1
#   end
# end
#
# # You can see in the make_one_year_older method we have used self.
# # What does self refer to here?
#
# # self refers to the object's instance variable that called the method.
# # In this case, we could also replace self with the @ symbol because we also have
# # a getter/setter method with attr_accessor.

# # 9
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
# # In the name of the cats_count method we have used self.
# # What does self refer to in this context?
#
# # In this case, self refers to the class and designates a class method.

# # 10
#
# # If we have the class below, what would you need to call to create a
# # new instance of this class.
#
# class Bag
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end
#
# # You would need to call Bag.new and specify arguments for the two instance
# # variables that are defined.  For example:
#
# baggy = Bag.new('green', 'canvas')
