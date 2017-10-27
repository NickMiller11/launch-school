# A triangle is classified as follows:

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.

# To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
# and all angles must be greater than 0: if either of these conditions is 
# not satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and 
# returns a symbol :right, :acute, :obtuse, or :invalid depending on whether 
# the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about 
# floating point errors. You may also assume that the arguments are 
# specified in degrees.

=begin

Input: 3 integers
Data structure: array
Output: symbol

Like the last exercise, I am going to add these numbers into an array
I will then first test if the triangle is valid, then apply the logic to
find out which triangle it is

- I will add the numbers to an array
- sort the array
- start a case statement
  - when sum of angles (using reduce) equals 180, no 0 angles
  - when angles include 90 --> right
  - when each angle is less than 90  - acute
  - when any one angle is greater than 90 - obtuse
  

=end

def triangle(num1, num2, num3)
  arr = [num1, num2, num3].sort
  case
  when arr.reduce(:+) != 180, arr.include?(0)
    :invalid
  when arr.include?(90)
    :right
  when arr.all? { |num| num < 90 }
    :acute
  when arr.any? { |num| num > 90 }
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid