# Write a method that can rotate the last n digits of a number. For example:



# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want.

# You may assume that n is always a positive integer.

=begin

Input: integer (to be rotated), integer (index of digit to be rotated)
Output: rotated integer

Rules:
- rotating just 1 digit results in original number being returned

Algorithm:
- convert integer to be rotated into an array
- digit is both end point and beginning point of slice, plus add negative that
  - to the end

=end

require "pry"

def rotate_array(arr)
  result_arr = arr[1..-1] + [arr[0]]
  result_arr
end

def rotate_rightmost_digits(num, digit)
  num_arr = num.to_s.chars.map(&:to_i)
  num_arr[-digit..-1] = rotate_array(num_arr[-digit..-1])
  num_arr.join.to_i
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
