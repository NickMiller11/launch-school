# If you take a number like 735291, and rotate it to the left, you get 352917. 
# If you now keep the first digit fixed in place, and rotate the remaining digits, 
# you get 329175. Keep the first 2 digits fixed in place and rotate again to 
# 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. 
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to 
# get 321579. The resulting number is called the maximum rotation of the original 
# number.

# Write a method that takes an integer as argument, and returns the maximum 
# rotation of that argument. You can (and probably should) use the 
# rotate_rightmost_digits method from the previous exercise.

=begin

Input: integer
Output: maximally-rotated integer

Rules:
- rotate the input integer input.size - 1 times, keeping an additional digit
  - stationary each rotation

Algorithm:
- I can use a loop or a method like upto to pass in consecutive digits to 
  - rotate_rightmost_digits method

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

def max_rotation(num)
  size = num.to_s.size
  count = size
  rotated_arr = rotate_rightmost_digits(num, count)
  loop do
    # binding.pry
    count -= 1
    rotated_arr = rotate_rightmost_digits(rotated_arr, count)
    break if count <= 1
  end
  rotated_arr
end



p max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(35) #== 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845
