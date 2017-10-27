# A triangle is classified as follows:

# equilateral - All 3 sides are of equal length
# isosceles - 2 sides are of equal length, while the 3rd is different
# scalene - All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the two shortest
# sides must be greater than the length of the longest side, and all
# sides must have lengths greater than 0: if either of these conditions
# is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or
# :invalid depending on whether the triangle is equilateral, isosceles,
# scalene, or invalid.

=begin
Input - 3 integers
Data structure: array
Output - symbol

determine if 3 integers make up a valid triangle - return :invalid if not valid
  - sum of two smallest numbers is greater than largest numbers
  - number can't be 0

if valid, determine type of triangle
  - all three numbers are the same --> equilateral
  - 2 numbers are equal, 3rd is different --> isosceles
  - all numbers are different --> scalene



define a method to determine the validity of the triangle
  add first two values of array together and compare with 3rd
  check there are no zeros

define method to determine triangle type
  add numbers to an array and sort it
  call method first to determine valid triangle or not
  case statement
  when all numbers equal each other
    :equilateral
  when 2 numbers equal but third different (count method)
    :isosceles
  else
    :scalene

=end

def valid_triangle?(arr)
  return false if arr[0] + arr[1] < arr[2] || arr.include?(0)
end


def triangle(num1, num2, num3)
  arr < num1 << num2 << num3
end



triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
