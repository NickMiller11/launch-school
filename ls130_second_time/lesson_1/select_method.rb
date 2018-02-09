# def select(array)
#   results = []
#   counter = 0
#   current_value = array[counter]
#   while counter < array.size do
#     results << current_value if yield(current_value)
#     counter += 1
#   end
#
#   results
# end

def select(array)
  results = []
  array.each do |el|
    results << el if yield(el)
  end

  results
end

p [1, 2, 3, 4, 5].select { |num| num.odd? }
