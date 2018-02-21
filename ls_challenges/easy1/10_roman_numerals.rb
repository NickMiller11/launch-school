# The Romans were a clever bunch. They conquered most of Europe and ruled it
# for hundreds of years. They invented concrete and straight roads and even
# bikinis. One thing they never discovered though was the number zero. This
# made writing and dating extensive histories of their exploits slightly more
# challenging, but the system of numbers they came up with is still in use today.
# For example the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M.
# (notice these letters have lots of straight lines and are hence easy to
# hack into stone tablets).

# 1  => I
# 10  => X
# 7  => VII

# There is no need to be able to convert numbers larger than about 3000.
# (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each
# digit separately starting with the left most digit and skipping any digit
# with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals
# 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

=begin

input: integer
output: string

rules:
- return a string roman numeral representation of a number
- ignore 0's

algorithm:
- create a result variable as an empty string
- iterate through the number using divmod(10)
- change the reminder into roman numbers until size of the number remaining is 0

=end

# class Integer
#   def to_roman
#     result = []
#     number = self
#     multiplier = 10

#     self.digits.size.times do
#       number, remaining = number.divmod(multiplier)
#       number *= multiplier
#       result.unshift(change_num_to_letter(remaining))
#       multiplier *= 10
#     end

#     result.join('')
#   end

#   def change_num_to_letter(num)
#     case num
#     when 1 then 'I'
#     when 2 then 'II'
#     when 3 then 'III'
#     when 4 then 'IV'
#     when 5 then 'V'
#     when 6 then 'VI'
#     when 7 then 'VII'
#     when 8 then 'VIII'
#     when 9 then 'IX'
#     when 10 then 'X'
#     when 20 then 'XX'
#     when 30 then 'XXX'
#     when 40 then 'XL'
#     when 50 then 'L'
#     when 60 then 'LX'
#     when 70 then 'LXX'
#     when 80 then 'LXXX'
#     when 90 then 'XC'
#     when 100 then 'C'
#     when 200 then 'CC'
#     when 300 then 'CCC'
#     when 400 then 'CD'
#     when 500 then 'D'
#     when 600 then 'DC'
#     when 700 then 'DCC'
#     when 800 then 'DCCC'
#     when 900 then 'CM'
#     when 1000 then 'M'
#     when 2000 then 'MM'
#     when 3000 then 'MMM'
#     end
#   end
# end


# LS Video

class Fixnum
  ROMAN_NUMERAL_RULES = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def to_roman
    roman_numeral = ""
    number = self
    ROMAN_NUMERAL_RULES.each do |roman_number, value|
      number_of_roman_letters = number / value
      roman_numeral += roman_number * number_of_roman_letters
      number -= number_of_roman_letters * value
    end
    roman_numeral
  end
end

# class Fixnum  --> student solution, very elegant but limited to num <= 3000

#   def to_roman
#     case
#     when self < 4
#       'I' * self
#     when self == 4
#       'IV'
#     when self < 9
#       'V' + (self - 5).to_roman
#     when self == 9
#       'IX'
#     when self < 40
#       'X' + (self - 10).to_roman
#     #.....

# end

=begin

Video notes:

Think of the ROMAN_NUMERAL_RULES pairs as coins that you can use to
make change

I knew the case statement method wasn't going to be the most efficient method.
I should remember this about using a hash to match up the values and divide/subtract
the number down

=end
