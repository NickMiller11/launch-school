=begin
Create a superclass called Vehicle for your MyCar class to inherit from and 
move the behavior that isn't specific to the MyCar class to the superclass. 
Create a constant in your MyCar class that stores information about the vehicle 
that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that 
also has a constant defined that separates it from the MyCar class in some way.
=end

module Loadable
  "I can load stuff"
end

class Vehicle
  attr_accessor :color
  attr_reader :year
  
  @@number_of_vehicles = 0
  
  def initialize(year, color, model)
    @@number_of_vehicles += 1
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(acceleration)
    @speed += acceleration
  end
  
  def brake(deceleration)
    @speed -= deceleration
  end
  
  def shut_off
    @speed = 0
  end
  
  def spray_paint(paint)
    self.color = paint
  end
  
  def self.print_vehicle_qty
    puts "There are #{@@number_of_vehicles} vehicles."
  end
  
  def self.gas_mileage(gas, miles)
    puts "This car gets #{miles / gas} miles to the gallon."
  end
  
  def age
    puts "This car is #{calculate_age} years old."
  end
  
  private
  
  def calculate_age
    t = Time.now.year
    t - year 
  end
end

class MyCar < Vehicle
  WHEELS = 4

  def to_s
    "I am a #{color} #{year} #{@model} car"
  end
end

class MyTruck < Vehicle
  include Loadable
  
  WHEELS = 6
  
  def to_s
    "I am a #{color} #{year} #{@model} truck"
  end
end

Vehicle.print_vehicle_qty
camcam = MyCar.new(2009, 'white', 'Toyota Camry')
trucky = MyTruck.new(2010, 'blue', 'Toyota Tundra')
mimi = MyCar.new(2017, 'grey', 'Toyota Mirai')
Vehicle.print_vehicle_qty

puts Vehicle.ancestors
puts
puts MyCar.ancestors
puts
puts MyTruck.ancestors
puts

camcam.age
trucky.age
mimi.age

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(other)
    self.grade > other.grade
  end
  
  protected
  
  attr_reader :grade
end

joe = Student.new("Joe", 97)
bob = Student.new("Bob", 59)
puts "Well done!" if joe.better_grade_than?(bob)