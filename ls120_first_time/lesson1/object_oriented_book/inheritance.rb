# module Swimmable
#   def swim
#     "I'm swimming"
#   end
# end
#
# class Animal; end
#
# class Fish < Animal
#   include Swimmable
# end
#
# class Mammal < Animal
# end
#
# class Cat < Mammal
# end
#
# class Dog < Mammal
#   include Swimmable
# end
#
# sparky = Dog.new
# neemo = Fish.new
# paws = Cat.new
#
# puts sparky.swim
# puts neemo.swim
# puts paws.swim

# module Walkable
#   def walk
#     "I'm walking."
#   end
# end
#
# module Swimmable
#   def swim
#     "I'm swimming"
#   end
# end
#
# module Climbable
#   def climb
#     "I'm climbing"
#   end
# end
#
# class Animal
#   include Walkable
#
#   def speak
#     "I'm an animal, and I speak!"
#   end
# end
#
# # puts "---Animal method lookup---"
# # puts Animal.ancestors
#
# # fido = Animal.new
# # puts fido.speak
# # puts fido.walk
# # puts fido.swim
#
# class GoodDog < Animal
#   include Swimmable
#   include Climbable
# end
#
# puts "---GoodDog method lookup---"
# puts GoodDog.ancestors

# module Mammal
#   class Dog
#     def speak(sound)
#       p "#{sound}"
#     end
#   end
#
#   class Cat
#     def say_name(name)
#       p "#{name}"
#     end
#   end
#
#   def self.some_out_of_place_method(num)
#     num ** 2
#   end
#
# end
#
# buddy = Mammal::Dog.new
# kitty = Mammal::Cat.new
#
# buddy.speak("Arf!")
# kitty.say_name("kitty")
#
# value = Mammal.some_out_of_place_method(4)

# class GoodDog
#   DOG_YEARS = 7
#
#   attr_accessor :name, :age
#
#   def initialize(n, a)
#     self.name = n
#     self.age = a
#   end
#
#   private
#
#   def human_years
#     age * DOG_YEARS
#   end
#
#   def public_disclosure
#     "#{self.name} in human years is #{human_years}"
#   end
# end
#
# sparky = GoodDog.new("Sparky", 4)
# # puts sparky.human_years
# puts sparky.public_disclosure

class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "Yes, I'm proteted!"
  end
end

fido = Animal.new
puts fido.a_public_method
puts fido.a_protected_method
