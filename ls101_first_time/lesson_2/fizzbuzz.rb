require "pry"


def fizzbuzz(num1, num2)
  new_array = []
  num1.upto(num2) { |i| new_array << i }
  fb_array = new_array.map do |i|
    if i % 3 == 0 && i % 5 == 0
      i = 'FizzBuzz'
    elsif i % 3 == 0
      i = 'Fizz'
    elsif i % 5 == 0
      i = 'Buzz'
    else
      i = i
    end
  end
  puts fb_array.join(", ")
end

fizzbuzz(3,15)
