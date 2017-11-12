# Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array.
# You may assume that the Array always contains at least one number.

def sum_of_sums(arr)
  total = 0
  sum_arr = []
  loop do
    sum_arr << arr.shift
    total += sum_arr.inject(:+)
    break if arr.size == 0
  end
  total
end

def sum_of_sums_ls(arr)
  total = 0
  1.upto(arr.size) do |count|
    total += arr.slice(0, count).reduce(:+)
  end
  total
end



p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

p sum_of_sums_ls([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums_ls([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums_ls([4]) == 4
p sum_of_sums_ls([1, 2, 3, 4, 5]) == 35

# ways to solve this:
# - recursive solution
# - unshifting each element over to a new array and inject
