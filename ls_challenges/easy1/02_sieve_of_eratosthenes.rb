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