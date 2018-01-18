module Delegate
  def delegate_work
  end
end

class Employee
  attr_reader :name, :serial_num, :type, :vacation_days, :desk

  def initialize(name, serial_num)
    @name = name
    @serial_num = serial_num
  end

  def to_s
    <<-MSG
      Name: #{name}
      Type: #{type}
      Serial number: #{serial_num}
      Vacation days: #{vacation_days}
      Desk: #{desk}
    MSG
  end
end

class PartTimeEmployee < Employee
  def initialize(name, serial_num)
    super(name, serial_num)
    @type = "Part-time"
    @vacation_days = 0
    @desk = "open workspace"
  end
end

class FullTimeEmployee < Employee
  def take_vacation
  end
end

class Regular < FullTimeEmployee
  def initialize(name, serial_num)
    super(name, serial_num)
    @type = "Regular"
    @vacation_days = 10
    @desk = "cubical farm"
  end
end

class Executive < FullTimeEmployee
  include Delegate

  def initialize(name, serial_num)
    super(name, serial_num)
    @type = "Executive"
    @vacation_days = 20
    @desk = "corner office"
  end
end

class Manager < FullTimeEmployee
  include Delegate

  def initialize(name, serial_num)
    super(name, serial_num)
    @type = "Manager"
    @vacation_days = 14
    @desk = "private office"
  end
end

dave = Manager.new("Dave", 12345)
puts dave
puts
tom = Executive.new("Tom", 67890)
puts tom
puts
holly = Regular.new("Holly", 24680)
puts holly
puts
kenji = PartTimeEmployee.new("Kenji", 13579)
puts kenji
