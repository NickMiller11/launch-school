=begin

Write a method that returns a list of all of the divisors of the
positive integer passed in as an argument.
The return value can be in any sequence you wish.

input: integer
output: array of integers

rules:
- return an array that includes all divisors of the input argument

algorithm:
- input downto 1
- check each integer if the input modulo increment integer is 0
  - if so, add to result array
  - if not, keep going

=end

def divisors(int)
  result = []
  int.downto(1) do |num|
    if int % num == 0
      result << num
    end
  end
  result.sort
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# LS Solution

def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end