# Build a program that asks a user for the length and width of a room
# in meters and then displays the area of the room in both square meters
# and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).


=begin

Input: n/a
Output: string

Rule:
- ask for dimensions of a room

Algorithm:
- ask user for length of room, assign to a variable
- ask user for width of room, assign to a variable
- convert meters to feet
- print string inserting square meters and square feet (floats)

=end

METERS_TO_FEET = 10.7639

puts("Enter the length of the room in feet:")
length = gets.chomp.to_f
puts("Enter the width of the room in feet:")
width = gets.chomp.to_f
square_feet = (length * width).round(2)
square_inches = (square_feet * 144).round(2)
square_centimeters = (square_feet * 9.29).round(2)
puts("The area of the room is #{square_feet} square feet" +
  " (#{square_inches} square inches and #{square_centimeters} square centimeters).")
