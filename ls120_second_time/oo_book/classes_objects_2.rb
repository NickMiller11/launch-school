# Add a class method to your MyCar class that calculates the gas mileage
# of any car

class MyCar
  attr_accessor :color
  attr_reader :year
  
  def self.gas_mileage(gas, miles)
    puts "This car gets #{miles / gas} miles to the gallon."
  end
  
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
  
  def to_s
    "I am a #{color} #{year} #{@model}"
  end
end