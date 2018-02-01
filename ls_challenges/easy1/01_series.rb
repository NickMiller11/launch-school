=begin

Write a program that will take a string of digits and give you all the
possible consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:

- 012
- 123
- 234

And the following 4-digit series:

- 0123
- 1234

And if you ask for a 6-digit series from a 5-digit string,
you deserve whatever you get.

input: string of integers
output: array of nested arrays of integers

rules:
- take in a string of integers
- output an array that includes arrays of size n
  - arrays include consecutive integers
- trying to use an n value larger than the input array size raises an ArgumentError

algorithm:
- create a Series class
  - create an ivar that is an array with each integer as an element
- create a slice method
  - instantiate a new array
  - use each_with_index to iterate over array
    - slice the array using n
    - pass each slice into a new array
  - return new array

=end

class Series
  attr_reader :array

  def initialize(a)
    @array = a.chars.map(&:to_i)
  end

  def slices(n)
    raise ArgumentError if n > array.size

    result = []
    @array.each_with_index do |el, idx|
      result << @array[idx, n]
      break if idx + n == @array.size
    end
    result
  end
end

test_series = Series.new('01234')
p test_series.slices(1)