=begin

Write a program that, given a number, can find the sum of all the multiples
of particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20 that are
multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The
sum of these multiples is 78.

Write a program that can find the sum of the multiples of a given set of
numbers. If no set of numbers is given, default to 3 and 5.

input:
- a SumOfMultiples object initialized with or w/o a set of numbers
- calling a #to method that has a parameter that is the max value

output:
- the sum of all multiples of the passed in set of numbers up to, but not including
  the agrument passed into the #to method

rules:
- Use 3 and 5 if there is no set of numbers passed in as an argument

algorithm:
- create an initialize method passing in an optional argument (default to 3, 5)
- for each number in the range from 1 up to (but not including) max number
  - check to see if max number modulo set number (each one) equals 0.
    - if so, pass it into a new array
- reduce the array to sum up

=end

class SumOfMultiples
  @@number_set = [3, 5]

  def initialize(*number_set)
    @number_set = number_set
  end

  def self.to(max, multiples = [3, 5])
    arr = [0]
    1.upto(max) do |i|
      break if i == max
      multiples.each { |num| arr << i if calculate(num, i) }
    end

    arr.uniq.reduce(:+)
  end

  def to(max)
    self.class.to(max, @number_set)
  end

  private

  def self.calculate(num, i)
    i % num == 0
  end
end
