# Create a class called MyCar. When you initialize a new instance or object of 
# the class, allow the user to define some instance variables that tell us the
# year, color, and model of the car. Create an instance variable that is set to
# 0 during instantiation of the object to track the current speed of the car as 
# well. Create instance methods that allow the car to speed up, brake, and shut 
# the car off.

class MyCar
  attr_accessor :color
  attr_reader :year
  
  def initialize(year, color, model)
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
end