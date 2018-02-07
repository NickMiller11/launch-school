# Write a method that takes a sorted array of integers as an argument,
# and returns an array that includes all of the missing integers (in order)
# between the first and last elements of the argument.

# Examples:

require 'pry'

def missing(arr)
  result = []
  return result if arr.size == 1 || arr.empty?
  arr.each_with_index do |num, index|
    loop do
      num += 1
      break if num == arr[index + 1] || index == arr.size - 1
      result << num
    end
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# LS Solution - I like this one, definitely a lot more elegant than mine

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
