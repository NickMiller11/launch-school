# Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, 
# but the definition may lead to problems in the future. 
# How can this class be fixed to be resistant to future problems?

=begin 

Change the attr_accessor to attr_reader since I don't think you'll need
to modify a Database object.

After checking the LS answer, seems like the best way forward is just to
delete the attr_accessor

=end