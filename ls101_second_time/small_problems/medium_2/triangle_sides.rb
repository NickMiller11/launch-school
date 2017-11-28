# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the two shortest sides 
# must be greater than the length of the longest side, and all sides must 
# have lengths greater than 0: if either of these conditions is not satisfied, 
# the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as 
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or 
# :invalid depending on whether the triangle is equilateral, isosceles, 
# scalene, or invalid.

=begin

Input: 3 integers (lengths of sides of triangle)
Output: symbol (what type of triangle)

Rules:
- equilateral - all three numbers are same
- isosceles - 2 numbers are the same
- scalene - all three numbers different
- sum of two smallest numbers must be greater than largest number
- no number can be 0

Algorithm:
- flow control!  

=end

def triangle(side1, side2, side3)
  arr = [side1, side2, side3].sort
  if side1 == side2 && side2 == side3
    :equilateral
  elsif (arr[0] + arr[1]) < arr[2] || arr.include?(0)
    :invalid
  elsif arr[0] == arr[1] || arr[1] == arr[2]
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid