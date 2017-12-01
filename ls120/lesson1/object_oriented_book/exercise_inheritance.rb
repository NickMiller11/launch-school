# Create a superclass called Vehicle for your MyCar class to inherit from and 
# move the behavior that isn't specific to the MyCar class to the superclass. 
# Create a constant in your MyCar class that stores information about the vehicle 
# that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that 
# also has a constant defined that separates it from the MyCar class in some way.

# module Towable
#   def can_tow?(pounds)
#     pounds < 2000 ? true : false
#   end
# end

# class Vehicle
# attr_reader :year, :model
# attr_accessor :color
# @@number_of_vehicles = 0
  
#   def initialize(year, color, model)
#     @year = year
#     @color = color
#     @model = model
#     @current_speed = 0
#     @@number_of_vehicles += 1
#   end
  
#   def speed_up(number)
#     @current_speed += number
#     puts "You have accelerated #{number} mph."
#   end

#   def brake(number)
#     @current_speed -= number
#     puts "You have decelerated #{number} mph."
#   end

#   def current_speed
#     puts "You are currently going #{@current_speed} mph."
#   end

#   def shut_off
#     @current_speed = 0
#     puts "You have shut off the car."
#   end

#   def self.gas_mileage(gallons, miles)
#     mileage = miles / gallons
#     "Your car gets #{mileage} mpg."
#   end
  
#   def spray_paint(color)
#     self.color = color
#     puts "You've given your car a beautiful spray paint job turning it #{self.color}"
#   end
  
#   def age
#     "Your #{self.model} is #{years_old} years old."
#   end
  
#   private
  
#   def years_old
#     Time.now.year - @year
#   end
  
# end

# class MyTruck < Vehicle
#   include Towable
#   NUMBER_OF_DOORS = 2
  
#   def to_s
#     "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
#   end
# end


# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

#   def to_s
#     "My car is a #{year} #{color} #{@model}!"
#   end
# end

# cam_cam = MyCar.new(2009, 'white', 'Toyota Camry')
# puts cam_cam.age

# puts MyCar.ancestors
# puts MyTruck.ancestors
# puts Vehicle.ancestors

class Student
  attr_accessor :name
  
  def initialize(name,grade)
    @name = name
    @grade = grade
  end
  
  def better_grade_than?(other_student)
    grade > other_student.grade
  end
    
  protected
  
  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)