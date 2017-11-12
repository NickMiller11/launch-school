# A featured number (something unique to this exercise) is an odd number
# that is a multiple of 7, and whose digits occur exactly once each. So,
# for example, 49 is a featured number, but 98 is not (it is not odd), 97
# is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument. Issue an error message
# if there is no next featured number.

=begin

Input: integer
Output: integer

Starts from input integer
Multiply by 7
Check to see if the number is odd with Integer#odd?
Check to see that the number has no repeating digits by converting to array
  with Integer#digits, calling Array#uniq, and comparing result to original Input
Return first true number

Return error?

=end

require "pry"

def featured(num)
  start = 1
  loop do
    int = start * 7
    return int if int.odd? && int.digits.reverse.uniq.join.to_i == int &&
    int > num
    start += 1
    # binding.pry
  end
end

def featured_ls(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements'
end


p featured_ls(12) #== 21
p featured_ls(20) #== 21
p featured_ls(21) #== 35
p featured_ls(997) #== 1029
p featured_ls(1029) #== 1043
p featured_ls(999_999) #== 1_023_547
p featured_ls(999_999_987) #== 1_023_456_987
