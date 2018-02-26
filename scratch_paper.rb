=begin

input: string of n positive numbers (n can be 0)
output:
  - an array of two subarrays.  Each array is structured like:
  - [number-weight, index in input string of correstponding number, original nuber]

rules:
- sort each output sub aray by ascending order of number weights if different,
  or by indexes if weights are the same


algorithm:
- turn string into array
- create a new array for output
- each with index
  - calculate and push weight into output array
  - push index into output array
  - push original number into output array
- compare each sub array and reference the ones that has the smallest different in weights
  - with the smallest weights
  - and smallest indexes

  keep only subarrays with smallest difference between weighted values
  keep only smallest numbers
  keep only smallest indexes

=end

require 'pry'

def closest(strng)
  strng.split
    .map
    .with_index { |a, i| [a.chars.map(&:to_i).reduce(0, :+), i, a.to_i] }
    binding.pry
    .sort
    .each_cons(2)
    binding.pry
    .min_by { |a| [a[1][0] - a[0][0]]} || []
end

p closest("456899 50 11992 176 272293 163 389128 96 290193 85 52")
p closest("80 71 62 53")