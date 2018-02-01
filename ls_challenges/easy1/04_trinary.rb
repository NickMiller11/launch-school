=begin

Write a program that will convert a trinary number,
represented as a string (e.g. '102012'), to its decimal
equivalent using first principles (without using an existing
method or library that can work with numeral systems).

Trinary numbers can only contain three symbols: 0, 1, and 2.
Invalid trinary entries should convert to decimal number 0.

The last place in a trinary number is the 1's place. The second
to last is the 3's place, the third to last is the 9's place, etc.

# "102012"

    1       0       2       0       1       2    # the number
1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
  243 +     0 +    54 +     0 +     3 +     2 =  302

input: a number string
output: an integer

rules:
- multiply each digit of the number string by 3 to the n power.
- n starts at 0 in the one's place and increments by one for each place
- add all numbers together and return the sum
- any number other than 0, 1, or 2 in the number string means it is invalid
  and should be converted to 0

algorithm:
- make the to_decimal instance method a ternary conditional
  - check if the input string is valid
    - if not, return 0
    - if so, exeecute the calculation

- valid_input
  - check if numbers in string are anything other than 0, 1, or 2
  - check if any letters appear in string

- calculate
  - create a counter
  - iterate over the array with map
  - multiply each int by 3 to counter power
  - reduce at the end


=end

require 'pry'

class Trinary
  def initialize(num_string)
    @num_string = num_string
    @num_array = num_string.chars.map(&:to_i)
  end

  def to_decimal
    valid_input? ? calculate : 0
  end

  private

  def valid_input?
    @num_string.to_i.to_s == @num_string ||
    @num_array.any? { |num| num > 2 || num < 0 }
  end

  def calculate
    counter = @num_array.size
    @num_array.map! do |int|
      counter -= 1
      int*3**counter
    end
    @num_array.reduce(:+)
  end
end