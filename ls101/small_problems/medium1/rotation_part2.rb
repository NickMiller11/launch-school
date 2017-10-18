# Write a method that can rotate the last n digits of a number. For example:
# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want.
# You may assume that n is always a positive integer.

require 'pry'

def rotate_rightmost_digits(num, index)
  arr = num.digits.reverse
  removed_digit = -index
  arr.delete_at(removed_digit)
end

p rotate_rightmost_digits(735291, 1) # == 735291
p rotate_rightmost_digits(735291, 2) # == 735219
p rotate_rightmost_digits(735291, 3) # == 735912
p rotate_rightmost_digits(735291, 4) # == 732915
p rotate_rightmost_digits(735291, 5) # == 752913
p rotate_rightmost_digits(735291, 6) # == 352917

# def rotate_rightmost_digits(num, index)
#   arr = num.digits.reverse
#   corrected_index = -index - 1
#   binding.pry
#   if index == 1
#     arr[0..corrected_index] + arr[corrected_index + 1..-1]
#   else
#     arr[0..corrected_index] + arr[corrected_index + 1..-1] + [arr[-index]]
#   end
# end
