# class GoodDog
#   attr_accessor :name, :height, :weight
#   # attr_reader   :name
#   # attr_writer   :name
#
#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end
#
#   # def get_name
#   #   @name
#   # end
#   #
#   # def name
#   #   @name
#   # end
#   #
#   # def set_name=(name)
#   #   @name = name
#   # end
#   #
#   # def name=(n)
#   #   @name = n
#   # end
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
#     "I'm a GoodDog class!"
#   end
# end
#
# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.speak
# puts sparky.info
# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info

# class GoodDog
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

# class GoodDog
#   DOG_YEARS = 7
#
#   attr_accessor :name, :age
#
#   def initialize(n, a)
#     self.name = n
#     self.age = a * DOG_YEARS
#   end
#
#   def to_s
#     "This dog's name is #{name} and it is #{age} in dog years."
#   end
# end
#
# sparky = GoodDog.new("Sparky", 4)
# puts sparky.age
# puts sparky
# p sparky

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weights #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end

end

sparky = GoodDog.new('Sparky','12 inches', '10 lbs')
p sparky.what_is_self

class MyAwesomeClass
  def self.this_is_a_class_method
  end
end
