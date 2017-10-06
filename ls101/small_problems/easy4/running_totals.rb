# Write a method that takes an Array of numbers, and returns
# an Array with the same number of elements, and each element
# has the running total from the original Array.

def running_total(arr)
  intermediate = []
  final = []
  counter = 0
  return arr if arr.empty?
  loop do
    intermediate << arr[counter]
    final << intermediate.sum
    counter += 1
    break if counter >= arr.size
  end
  final
end

# Wow, I really like the LS answer

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
