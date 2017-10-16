# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the
# substring begins. This means that all substrings that start at
# position 0 should come first, then all substrings that start at
# position 1, and so on. Since multiple substrings will occur at
# each position, the substrings at a given position should be returned
# in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in
# the previous exercise:

def substrings(str)
  final_arr = []
  counter = 0
  times = str.length
  loop do
    1.upto(times) do |count|
      final_arr << str.slice(counter,count)
    end
    counter += 1
    times -= 1
    break if counter == str.length
  end
  final_arr
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
