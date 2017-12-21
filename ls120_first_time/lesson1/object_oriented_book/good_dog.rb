# module Speak # object model example
#   def speak(sound)
#     puts("#{sound}")
#   end
# end
#
# class GoodDog
#   include Speak
# end
#
# class HumanBeing
#   include Speak
# end
#
# puts "---GoodDog ancestors---"
# puts GoodDog.ancestors
# puts ''
# puts "---HumanBeing ancestors---"
# puts HumanBeing.ancestors

# class GoodDog # example of the constructor
#   def initialize
#     puts "This object was just initialized!"
#   end
# end
#
# sparky = GoodDog.new

# class GoodDog # second try through the exercise
#   attr_accessor :name, :height, :weight
#
#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end
#
#   def speak
#     "#{name} says arf!"
#   end
#
#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end
#
#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end
#
#   def self.what_am_i
#     "I'm a GoodDog class"
#   end
# end
#
# puts GoodDog.what_am_i

# class GoodDog # class variable/method intro
#   @@number_of_dogs = 0
#
#   def initialize
#     @@number_of_dogs += 1
#   end
#
#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end
# end
#
# puts GoodDog.total_number_of_dogs
#
# dog1 = GoodDog.new
# dog2 = GoodDog.new
#
# puts GoodDog.total_number_of_dogs

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end

sparky = GoodDog.new("Sparky", 4)
puts "#{sparky}"
