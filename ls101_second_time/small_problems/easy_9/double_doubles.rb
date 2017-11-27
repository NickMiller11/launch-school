# A double number is a number with an even number of digits whose left-side
# digits are exactly the same as its right-side digits. For example, 44, 3333,
# 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
#
# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned as-is.

=begin

Input: integer
Output: integer

Rules:
- return the product of the integer and 2 if it is not a double number
- return the input as is a double number

Algorithm:
- to check if it is a double number, I should first change it into a string
  - if the length is even and string[0, length/2] == string[length/2, length/2]
    - return input as is
  - else
    - return input * 2

=end

def twice(num)
  string_num = num.to_s
  center = string_num.size/2
  if string_num.length.even? && string_num[0, center] == string_num[center..-1]
    num
  else
    num*2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
