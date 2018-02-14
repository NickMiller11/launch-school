=begin

Write a program that uses the Sieve of Eratosthenes to find all the primes
from 2 up to a given number.

The Sieve of Eratosthenes is a simple, ancient algorithm for finding all
prime numbers up to any given limit. It does so by iteratively marking as
composite (i.e. not prime) the multiples of each prime,
starting with the multiples of 2.

Create your range, starting at two and continuing up to and including the
given limit. (i.e. [2, limit]).

The algorithm consists of repeating the following over and over:

- take the next available unmarked number in your list (it is prime)
- mark all the multiples of that number (they are not prime)

Repeat until you have processed each number in your range.
When the algorithm terminates, all the numbers in the list
that have not been marked are prime.
The wikipedia article has a useful graphic that explains the algorithm.

Notice that this is a very specific algorithm,
and the tests don't check that you've implemented the algorithm,
only that you've come up with the correct list of primes.

--------------

input: an instance method call to #primes from a Sieve object with an argument n
output: an array with all prime integers from 2 to n

rules:
- return an array of all prime integers from 2 to n

algorithm:
- create a Sieve class
  - create an instance variable that is the max number
  - create a primes method
    - create an array that includes all digits between 2 and the max number
    - iterate through the array
      - delete any element that is a multple of the number being checked


=end

class Sieve
  def initialize(max)
    @max = max
  end

  def primes
    number_set = (2..@max).to_a
    counter = 2

    loop do

      number_set.each do |num|
        next if num == counter
        number_set.delete(num) if num % counter == 0
      end

      counter += 1
      break if counter >= number_set[-1] / 2
    end

    number_set
  end
end

# Thoughts after watching solution video:

# It might have been a more literal interpretation of the problem
# if I marked the numbers in an array in some way (for example, as nil)
# and compacted the array rather than deleting.

# Deleting is also not as optimized. When you delete an element in an array,
# the system needs to move each element after it down an index

#FizzBuzz Practice


result = Array.new

1.upto(100) do |num|
  case
  when num % 3 == 0 && num % 5 == 0 then result << "FizzBuzz"
  when num % 3 == 0                 then result << "Fizz"
  when num % 5 == 0                 then result << "Buzz"
  else                                   result << num
  end
end

puts result.join(" ")

class FizzBuzz
  def self.print_fizz_buzz(limit=100)
    @numbers = (1..limit).to_a
    @numbers.map! do |number|
      if number % 3 == 0 && number % 5 == 0
        'FizzBuzz'
      elsif number % 3 == 0
        'Fizz'
      elsif number % 5 == 0
        'Buzz'
      else
        number
      end
    end
    puts @numbers.join(" ")
  end
end

FizzBuzz.print_fizz_buzz(100)
