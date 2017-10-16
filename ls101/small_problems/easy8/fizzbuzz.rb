# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number
# is divisible by 5, print "Buzz", and finally if a number is divisible by
# 3 and 5, print "FizzBuzz".

def fizzbuzz(int1, int2)
  arr = []
  int1.upto(int2) { |count| arr << count }
  arr.map! do |v|
    if v % 3 == 0 && v % 5 == 0
      v = 'FizzBuzz'
    elsif v % 3 == 0
      v = 'Fizz'
    elsif v % 5 == 0
      v = 'Buzz'
    else
      v
    end
  end
  arr
end

def fizzbuzz_ls(int1, int2)
  arr = []
  int1.upto(int2) do |count|
    arr << fizzbuzz_value_ls(count)
  end
  arr.join(', ')
end

def fizzbuzz_value_ls(int)
  case
  when int % 3 == 0 && int % 5 == 0
    'FizzBuzz'
  when int % 3 == 0
    'Fizz'
  when int % 5 == 0
    'Buzz'
  else
    int
  end
end

p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
