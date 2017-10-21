# Write a method which takes a grocery list (array) of fruits with
# quantities and converts it into an array of the correct number of each fruit.

def buy_fruit(arr)
  list = []
  arr.each do |fruit|
    fruit[1].times {list << fruit[0]}
  end
  list
end

def buy_fruit_ls(list)
  list.map { |fruit, times| [fruit] * times }.flatten
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

p buy_fruit_ls([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
