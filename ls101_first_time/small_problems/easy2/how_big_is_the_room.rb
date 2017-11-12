# Build a program that asks a user for the length and
# width of a room in meters and then displays the area
# of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

SQMETERS_TO_SQFEET = 10.7639

def puts_room_area
  puts "Please input a room length in meters"
  length = gets.chomp.to_f
  puts "Please input a room width in meters"
  width = gets.chomp.to_f
  sq_meters = length * width
  sq_feet = sq_meters * SQMETERS_TO_SQFEET
  puts "The area of the room is #{sq_meters.round(2)} square meters (#{sq_feet.round(2)} square feet)."
end

puts_room_area
