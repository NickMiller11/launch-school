# class Car # Attribute Accessors
#
#   attr_reader :name, :price
#   attr_writer :name, :price
#
#   def to_s
#     "#{@name}: #{@price}"
#   end
#
# end
#
#
# c1 = Car.new
# c2 = Car.new
#
# c1.name = "Porsche"
# c1.price = 23500
#
# c2.name = "Volkswagen"
# c2.price = 9500
#
# puts "The #{c1.name} costs #{c1.price}"
#
# puts c1
# puts c2

# class Book # Attribute Accessors
#   attr_accessor :title, :pages
# end
#
# b1 = Book.new
# b1.title = "Hidden motives"
# b1.pages = 255
#
# p "The book #{b1.title} has #{b1.pages} pages"

# class MMath # Class Constants
#
#   PI = 3.141592
# end
#
# puts MMath::PI

# class Being # to_s method
#
#   def to_s
#     "This is a Being class"
#   end
# end
#
# b = Being.new
# puts b.to_s # explicit calling
# puts b # implicit calling

# class Circle #operator overloading
#
#   attr_accessor :radius
#
#   def initialize r
#     @radius = r
#   end
#
#   def +(other)
#     Circle.new @radius + other.radius
#   end
#
#   def to_s
#     "Circle with radius: #{@radius}"
#   end
# end
#
# c1 = Circle.new 5
# c2 = Circle.new 6
# c3 = c1 + c2
#
# p c3

# class Circle #class methods
#
#   def initialize x
#     @r = x
#   end
#
#   def self.info
#     "This is a Circle class"
#   end
#
#   def area
#     @r * @r * 3.131592
#   end
#
# end
#
# p Circle.info
# c = Circle.new 3
# p c.area

# class Wood #class methods
#
#   def self.info
#     "This is a Wood class"
#   end
# end
#
# class Brick
#
#   class << self
#     def info
#       "This is a Brick class"
#     end
#   end
# end
#
# class Rock
#
# end
#
# def Rock.info
#   "This is a Rock class"
# end
#
# p Wood.info
# p Brick.info
# p Rock.info

# class Wood #instance methods
#
#   def info
#     "This is a wood object"
#   end
# end
#
# wood = Wood.new
# p wood.info
#
# class Brick
#
#   attr_accessor :info
# end
#
# brick = Brick.new
# brick.info = "This is a brick object"
# p brick.info
#
# class Rock
#
# end
#
# rock = Rock.new
#
# def rock.info
#   "This is a rock object"
# end
#
# p rock.info

# class Animal #polymorphism
#    def make_noise
#      "Some noise"
#    end
#
#    def sleep
#      puts "#{self.class.name} is sleeping."
#    end
#  end
#
#
# class Dog < Animal
#
#   def make_noise
#     'Woof!'
#   end
# end
#
# class Cat < Animal
#
#   def make_noise
#     'Meow!'
#   end
# end
#
# [Animal.new, Dog.new, Cat.new].each do |animal|
#   puts animal.make_noise
#   animal.sleep
# end

# include Math #modules
#
# puts PI
# puts sin 2

# module Forest #modules
#
#   class Rock ; end
#   class Tree ; end
#   class Animal ; end
# end
#
# module Town
#
#   class Pool ; end
#   class Cinema ; end
#   class Square ; end
#   class Animal ; end
# end
#
# p Forest::Tree.new
# p Forest::Rock.new
# p Town::Cinema.new
#
# p Forest::Animal.new
# p Town::Animal.new

# module Device #modules
#   def switch_on ; puts "on" end
#   def switch_off ; puts "off" end
# end
#
# module Volume
#   def volume_up ; puts "volume up" end
#   def volume_down ; puts "volume down" end
# end
#
# module Pluggable
#   def plug_in ; puts "plug in" end
#   def plug_out ; puts "plug out" end
# end
#
# class CellPhone
#   include Device, Volume, Pluggable
#
#   def ring
#     puts "ringing"
#   end
# end
#
# cph = CellPhone.new
# cph.switch_on
# cph.volume_up
# cph.ring

# x = 35 # exceptions 1
# y = 0
#
# begin
#   z = x / y
#   puts z
# rescue => e
#   puts e
#   p e
# end

# age = 17 # exceptions 2
#
# begin
#   if age < 18
#     raise "Person is a minor"
#   end
#
#   puts "Entry allowed"
# rescue => e
#   puts e
#   p e
#   exit 1
# end
