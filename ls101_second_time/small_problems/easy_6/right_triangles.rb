# Write a method that takes a positive integer, n, as an argument, and
# displays a right triangle whose sides each have n stars. The hypotenuse
# of the triangle (the diagonal side in the images below) should have one
# end at the lower-left of the triangle, and the other end at the upper-right.

=begin

Input: integer
Output: display pattern to screen

Rules:
- display a right triangle who's sides each have input integer's number of stars
- one end is in upper right, and other end at lower left

Algorithm:
- I can use two counters and add spaces/stars
- I can start with left counter times number of spaces, then right counter
and number of starts
- I will loop and each time I will subtract one from left counter and add one
to right counter

=end

def triangle(int)
  left_count, right_count = int - 1, 1
  loop do
    spaces = ' ' * left_count
    stars = '*' * right_count
    puts("#{spaces}#{stars}")
    break if left_count == 0
    left_count -= 1
    right_count += 1
  end
end


triangle(5)
triangle(9)
