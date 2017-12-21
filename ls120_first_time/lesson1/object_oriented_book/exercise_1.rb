# Create a class called MyCar. When you initialize a new instance or object of
# the class, allow the user to define some instance variables that tell us the
# year, color, and model of the car. Create an instance variable that is set to
# 0 during instantiation of the object to track the current speed of the car as
# well. Create instance methods that allow the car to speed up, brake, and shut
# the car off.

# class MyCar # first attempt
#   attr_accessor :color
#   attr_reader :year
#   attr_reader :model
#
#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#   end
#
#   def speed_up(number)
#     @current_speed += number
#     puts "You push the gas and accelerate #{number} mph."
#   end
#
#
#   def brake(number)
#     @current_speed -= number
#     puts "You push the brake and decelerate #{number} mph."
#   end
#
#   def current_speed
#     puts "You are now going #{@current_speed} mph."
#   end
#
#   def shut_down
#     @current_speed = 0
#     puts "Let's park this bad boy!"
#   end
#
#   def spray_paint(color)
#     self.color = color
#     puts "You spray paint your car #{color}."
#   end
# end
#
# mimi = MyCar.new(2017, 'Toyota Mirai', 'silver')
# mimi.speed_up(20)
# mimi.current_speed
# mimi.speed_up(20)
# mimi.current_speed
# mimi.brake(20)
# mimi.current_speed
# mimi.brake(20)
# mimi.current_speed
# mimi.shut_down
# mimi.current_speed
#
# mimi.color = 'blue'
# puts mimi.color
# puts mimi.year
#
# mimi.spray_paint('red') # first attempt

class MyCar

  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You have accelerated #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You have decelerated #{number} mph."
  end

  def current_speed
    puts "You are currently going #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "You have shut off the car."
  end

  def spray_paint(color)
    self.color = color
    puts "You've given your car a beautiful spray paint job turning it #{self.color}"
  end

  def self.gas_mileage(gallons, miles)
    mileage = miles / gallons
    "Your car gets #{mileage} mpg."
  end

  def to_s
    "My car is a #{year} #{color} #{@model}!"
  end

end

mimi = MyCar.new(2017, 'silver', 'Toyota Mirai')
mimi.speed_up(35)
mimi.current_speed
mimi.brake(15)
mimi.current_speed
mimi.shut_off

mimi.spray_paint("red")
puts mimi.color
puts mimi.year
puts MyCar.gas_mileage(5,300)
puts mimi
