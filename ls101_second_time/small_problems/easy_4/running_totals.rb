# Write a method that takes an Array of numbers, and returns an Array
# with the same number of elements, and each element has the running total
# from the original Array.

=begin

input: array of numbers
output: array of same size as imput

rules:
- return array where each successive number in array is a running total
  - of numbers of input array

algorithm:
- initialize a new array
- initialize a new sum local variable
- call each method on input variable
  - add number to sum and push sum to the new array

=end

def running_total(arr)
  running_total_arr = []
  sum = 0
  arr.each do |num|
    sum += num
    running_total_arr << sum
  end
  running_total_arr
end

def running_total2(arr)
  sum = 0
  arr.each_with_object([]) do |num, arr|
    sum += num
    arr << sum
  end
end

p running_total2([2, 5, 13]) #== [2, 7, 20]
p running_total2([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total2([3]) #== [3]
p running_total2([]) #== []
