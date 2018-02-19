=begin

The depth of an integer n is defined to be how many multiples of n it is
necessary to compute before all 10 digits have appeared at least once in
some multiple.

example:

let see n=42

Multiple         value         digits     comment
42*1              42            2,4
42*2              84             8         4 existed
42*3              126           1,6        2 existed
42*4              168            -         all existed
42*5              210            0         2,1 existed
42*6              252            5         2 existed
42*7              294            9         2,4 existed
42*8              336            3         6 existed
42*9              378            7         3,8 existed

Looking at the above table under digits column you can find all the
digits from 0 to 9, Hence it required 9 multiples of 42 to get all the digits.
So the depth of 42 is 9. Write a function named computeDepth which computes
the depth of its integer argument.Only positive numbers greater than zero
will be passed as an input.

input: integer
output: integer

rules:
- compute how many multiples of n is needed so every number between 0-9 shows
  up in any product
- return the number of multiples necessary

algorithm:
- create a hash with 0-9 as the keys, false as the values
- create a counter variable = 1
- create a sum variable
- loop do
  - multiply n * counter and assign to a new variable
  - use digits to break it into an array
  - use each on the array
    - for each digit, if the value for the key in the hash is false, mark it true
  - break the loop if all values are true
  - increment the counter
- return the counter

=end

def compute_depth n
  numbers = (0..9).each_with_object({}) { |num, hash| hash[num] = false }
  counter = 1
  loop do
    product = n * counter
    digits = product.to_s.split('').map(&:to_i)
    digits.each do |num|
      numbers[num] = true if numbers[num] == false
    end
    break if numbers.values.all? { |value| value == true }
    counter += 1
  end
  counter
end

p compute_depth(1)