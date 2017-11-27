# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

=begin

Input: nested array
Output: flat array

Rules:
- return an array with the strings of a particular fruit listed the number of
  - times as the integer in the input array

Algorithm:
- map method, add a space and multiply by integer
- flatten the final array

=end

def buy_fruit(arr)
  final_arr = arr.map do |subarr|
    subarr[0] << " "
    (subarr[0] * subarr[1]).split
  end
  final_arr.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
