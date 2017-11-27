# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".

=begin

Input: two integers
Output: puts all numbers in between two input integers, replacing certain numbers
        with strings

Rules:
- when printing to screen:
  - replace any number divisible by 3 with "Fizz"
  - replace any number divisible by 5 with "Buzz"
  - replace any number divisible by both 3 and 5 with FizzBuzz

Algorithm:
  - use a case statement with flow control logic

=end

def fizzbuzz(num1, num2)
  result = []
  num1.upto(num2) do |num|
    case
    when num % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    when num % 3 == 0
      result << "Fizz"
    when num % 5 == 0
      result << "Buzz"
    else
      result << num
    end
  end
  result.join(', ')
end



p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
