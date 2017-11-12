# Write a method that calculates and returns the index of the
#  first Fibonacci number that has the number of digits specified
# as an argument. (The first Fibonacci number has index 1.)

def find_fibonacci_index_by_length(len)
  arr = [1, 1]
  counter = 2

  loop do
      arr[counter] = arr[counter - 2] + arr[counter-1]
      break if arr[counter].to_s.length == len
      counter += 1
  end
  counter + 1
end


p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
