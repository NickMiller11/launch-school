# class Being
#
#   def initialize
#     puts "Being is created"
#   end
# end
#
# b1 = Being.new
# b2 = Being.allocate
# puts b2

# class Person # constructor overloading
#
#   def initialize name="unknown", age=0
#     @name = name
#     @age = age
#   end
#
#   def to_s
#     "Name: #{@name}, Age: #{@age}"
#   end
#
# end
#
# p1 = Person.new
# p2 = Person.new "unknown", 17
# p3 = Person.new "Nick", 33
# p4 = Person.new "Hitomi"
#
# puts p1, p2, p3, p4

# class Person # methods
#
#   def initialize name
#     @name = name
#   end
#
#   def get_name
#     @name
#   end
#
# end
#
# per = Person.new "Jane"
#
# puts per.get_name
# puts per.send :get_name

# class Circle #methods
#   @@PI = 3.141592
#
#   def initialize
#     @radius = 0
#   end
#
#   def set_radius radius
#     @radius = radius
#   end
#
#   def area
#     @radius * @radius * @@PI
#   end
#
# end
#
# c = Circle.new
# c.set_radius 5
# puts c.area

# class Some # access modifiers - public methods
#
#   def method1
#     puts "public method1 called"
#   end
#
#   public
#
#   def method2
#     puts "public method2 called"
#   end
#
#   def method3
#     puts "public method3 called"
#     method1
#     self.method1
#   end
# end
#
# s = Some.new
# s.method1
# s.method2
# s.method3
#
# puts "-------"

# class Some2 # access modifiers - private methods
#
#   def initialize
#     method1
#     #self.method1 # would lead to an error
#   end
#
#   private
#
#   def method1
#     puts "private method1 called"
#   end
#
# end
#
# s = Some2.new
# #s.method1
#
# puts "-------"

# class Some3 # acess modifiers - protected methods
#
#   def initialize
#     method1
#     self.method1
#   end
#
#   protected
#
#   def method1
#     puts "protected method1 called"
#   end
# end
#
#
# s = Some3.new
# # s.method1

# class Being # Inheritance
#
#   def initialize
#     puts "Being class created"
#   end
# end
#
# class Human < Being
#
#   def initialize
#     super
#     puts "Human class created"
#   end
# end
#
# Being.new
# Human.new

# class Being # Ancestors
# end
#
# class Living < Being
# end
#
# class Mammal < Living
# end
#
# class Human < Mammal
# end
#
# p Human.ancestors

# class Being # Multilevel inheritance
#
#   @@count = 0
#
#   def initialize
#     @@count += 1
#     puts "Being is created"
#   end
#
#   def show_count
#     "There are #{@@count} beings"
#   end
#
# end
#
# class Human < Being
#
#   def initialize
#     super
#     puts "Human is created"
#   end
# end
#
# class Animal < Being
#
#   def initialize
#     super
#     puts "Animal is created"
#   end
# end
#
# class Dog < Animal
#
#   def initialize
#     super
#     puts "Dog is created"
#   end
# end
#
# Human.new
# d = Dog.new
# puts d.show_count
#

# class Base # Inheritance and Access Modifiers
#   def initialize
#     @name = "Base"
#   end
#
#   private
#
#   def private_method
#     puts "private method called"
#   end
#
#   protected
#
#   def protected_method
#     puts "protected_method called"
#   end
#
#   public
#
#   def get_name
#     return @name
#   end
# end
#
# class Derived < Base
#
#   def public_method
#       private_method
#       protected_method
#     end
# end
#
# d = Derived.new
# d.public_method
# puts d.get_name

# class Base # Super
#
#   def show x=0, y=0
#     p "Base class, x: #{x}, y: #{y}"
#   end
# end
#
# class Derived < Base
#
#   def show x, y
#     super
#     super x
#     super x, y
#     super()
#   end
# end
#
# d = Derived.new
# d.show 3, 3
