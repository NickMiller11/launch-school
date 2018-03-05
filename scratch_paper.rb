# Some numbers have funny properties. For example:

# 89 --> 8¹ + 9² = 89 * 1

# 695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

# 46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

# Given a positive integer n written as abcd... (a, b, c, d... being digits)
# and a positive integer p we want to find a positive integer k, if it exists,
# such as the sum of the digits of n taken to the successive powers of p is
# equal to k * n. In other words:

# Is there an integer k such as :
# (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

# If it is the case we will return k, if not return -1.

# Note: n, p will always be given as strictly positive integers.

=begin

input: two integers
output: one integer

rules:
- raise the first digit of n to p, raise the second digit of n to p + 1
  and so on for each digit of n

- try to find a positive divisor of the sum of each digit of n raised to their
  respective powers, divided by n

- return the positive divisor if it exists.  If not, return -1

algorithm:
- create an array of each digit of n
- use map to raise each digit to a power
- increment the power variable by one for each digit
- use reduce to sum up the digits in the array
- divide by n and see if you get a whole number


=end

require 'pry'

def dig_pow(n, p)
  n_digits = n.to_s.chars.map(&:to_i).map.with_index {|digit, index| digit**(p+index)}.reduce(:+)
  n_digits % n == 0 ? n_digits / n : -1
end

# def dig_pow(n, p)
#   p -= 1
#   n_digits = n.to_s.chars.map(&:to_i).map do |digit|
#     p += 1
#     digit ** p
#   end

#   sum_of_powers = n_digits.reduce(:+)
#   sum_of_powers % n == 0 ? sum_of_powers / n : -1
# end
p dig_pow(89, 1)